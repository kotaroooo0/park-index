class CreateParks < ActiveRecord::Migration[5.1]
  def change
    create_table :parks do |t|
      t.string :name
      t.integer :comment_count, default: 0
      t.references :area, foreign_key: true
      t.references :skiresort, foreign_key: true
      t.timestamps
    end
  end
end
