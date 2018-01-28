class CreateSkiresorts < ActiveRecord::Migration[5.1]
  def change
    create_table :skiresorts do |t|
      t.string :name
      t.string :prefecture
      t.string :area

      t.timestamps
    end
  end
end
