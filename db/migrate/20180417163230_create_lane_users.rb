class CreateLaneUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :lane_users do |t|
      t.references :lane, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
