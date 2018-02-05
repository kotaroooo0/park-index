class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :age
      t.integer :gender
      t.integer :area_id
      t.string :image
      t.integer :comment_count, default: 0
      t.string :provider
      t.string :uid

      t.timestamps
    end
  end
end
