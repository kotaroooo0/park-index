class CreateSkiresorts < ActiveRecord::Migration[5.1]
  def change
    create_table :skiresorts do |t|
      t.string :name
      t.string :prefecture
      t.references :area, foreign_key: true
      t.integer :park_count, default: 0

      t.timestamps
    end
  end
end
