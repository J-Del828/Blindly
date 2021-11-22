class CreateMatches < ActiveRecord::Migration[6.0]
  def change
    create_table :matches do |t|
      t.boolean :want_match, default: false
      t.references :requester, foreign_key: { to_table: :users }, index: true
      t.references :partner, foreign_key: { to_table: :users }, index: true
      t.timestamps
    end
  end
end
