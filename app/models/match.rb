class Match < ApplicationRecord
  belongs_to :requester, foreign_key: 'requester_id', class_name: 'User'
  belongs_to :partner, foreign_key: 'partner_id', class_name: 'User'
end
