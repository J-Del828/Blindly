class Match < ApplicationRecord
  belongs_to :requester, foreign_key: 'requester_id', class_name: 'User'
  belongs_to :partner, foreign_key: 'partner_id', class_name: 'User'
  validates :requester_id, uniqueness: {scope: :partner_id}

  after_create :create_relationship_if_match

  private

  def create_relationship_if_match
    if want_match # is true ?
      # check stuff in DB
      @is_match = Match.find_by(requester_id: partner_id, partner_id: requester_id, want_match: true)
      # did partner also took a (positive) decision about requester ?
      if @is_match
        Relationship.create(partner_1_id: partner_id, partner_2_id: requester_id)
      end
    end
  end
end
