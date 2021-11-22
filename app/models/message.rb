class Message < ApplicationRecord
  belongs_to :match, foreign_key: 'match_id'
  belongs_to :relationship, foreign_key: 'relationship_id' 
end
