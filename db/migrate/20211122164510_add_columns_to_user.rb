class AddColumnsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string
    add_column :users, :age, :integer
    add_column :users, :biography, :text
    add_column :users, :interests, :string
    add_column :users, :gender, :string
    add_column :users, :preferred_gender, :string
    add_column :users, :preferred_age, :integer
  end
end
