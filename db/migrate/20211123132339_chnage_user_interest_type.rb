class ChnageUserInterestType < ActiveRecord::Migration[6.0]
  def up
    remove_column :users, :interests, :string
    add_column :users, :interests, :jsonb
  end

  def down
    remove_column :users, :interests, :jsonb
    add_column :users, :interests, :string
  end
end
