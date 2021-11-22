class CreateRelationships < ActiveRecord::Migration[6.0]
  def change
    create_table :relationships do |t|
      t.references :partner_1, foreign_key: { to_table: :users }, index: true
      t.references :partner_2, foreign_key: { to_table: :users }, index: true
      t.integer :affinity, default: 0
      t.timestamps
    end
  end
end
