class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :matches
  has_many :relationships
  validates :name, :age, :gender, presence: true

  before_validation :add_default_array

  INTERESTS = ["Dancing", "Cooking", "Baking", "Gardening", "Photography", "Painting", "Drawing", "Singing", "Reading",
               "Cycling", "Volunteering", "Hiking", "Working Out", "Traveling", "Finance", "Investing", "Meditation", "Yoga", "Sports",
               "Clubbing", "Partying", "Technology", "Movies", "Series"]

  def potential_partners(minimum: 50, age_range: 5)
    joins = <<-SQL.squish
    CROSS JOIN array_intersect(ARRAY['#{interests.join("','")}'], interests::text[]) AS common_interests
    CROSS JOIN array_length(common_interests, 1) AS number_of_common_interests
    CROSS JOIN GREATEST(array_length(interests, 1), #{interests.length}) AS max_interests
    CROSS JOIN CAST((number_of_common_interests / max_interests::decimal) * 100 AS integer) AS matching_percentage
    LEFT OUTER JOIN matches ON matches.requester_id = #{id} AND matches.partner_id = users.id
    SQL
    User.select("users.*, common_interests, number_of_common_interests, max_interests, matching_percentage").
      joins(joins).
      where(matches: { id: nil },
            gender: preferred_gender,
            age: (preferred_age - age_range)..(preferred_age + age_range)).
      where("matching_percentage >= #{minimum}").
      where.not(id: id)
  end

  def relationships
    Relationship.where(
      "partner_1_id = :user_id OR partner_2_id = :user_id",
      user_id: id
    )
  end

  private

  def add_default_array
    return if interests
    self.interests = []
  end
end
