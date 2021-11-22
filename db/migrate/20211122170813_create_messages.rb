class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.text :content
      t.references :match, foreign_key: { to_table: :matches }, index: true
      t.references :relationship, foreign_key: { to_table: :relationships }, index: true
      t.timestamps
    end
  end
end
