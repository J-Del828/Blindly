class AddUsersToMessages < ActiveRecord::Migration[6.0]
  def change
    add_reference :messages, :user, foreign_key: true
    remove_reference :messages, :match, foreign_key: true
  end
end
