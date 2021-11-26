class Relationship < ApplicationRecord
  belongs_to :partner_1, foreign_key: 'partner_1_id', class_name: 'User'
  belongs_to :partner_2, foreign_key: 'partner_2_id', class_name: 'User'
  has_many :messages
end
