class CreateParks < ActiveRecord::Migration[5.1]
  def change
    create_table :parks do |t|
      t.string :name
      t.integer :item
      t.string :level
      t.integer :skiresort_id
      t.integer :comment_count, default: 0

      t.timestamps
    end
  end
end
