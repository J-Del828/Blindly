class ChangeInterestColumnType < ActiveRecord::Migration[6.0]
  def up
    remove_column :users, :interests, :jsonb
    add_column :users, :interests, :string, array: true
  end

  def down
    add_column :users, :interests, :jsonb
    remove_column :users, :interests, :string, array: true
  end
end
