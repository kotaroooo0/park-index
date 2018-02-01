class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :age
      t.string :gender
      t.string :area
      t.string :image
      t.string :provider
      t.string :uid

      t.timestamps
    end
  end
end
