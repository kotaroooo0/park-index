class CreateLanes < ActiveRecord::Migration[5.1]
  def change
    create_table :lanes do |t|
      t.string :name
      t.text :items
      t.integer :park_id

      t.timestamps
    end
  end
end
