class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :matches
  has_many :relationships
  validates :name, :age, :gender, presence: true
  INTERESTS = ["Dancing", "Cooking/Baking", "Gardening", "Photography", "Painting/Drawing", "Singing", "Reading",
               "Cycling",
               "Volunteering", "Hiking", "Working Out", "Traveling", "Finance/Investing", "Meditation/Yoga", "Sports",
               "Clubbing/Partying",
               "Technology", "Movies/Series"]
end
