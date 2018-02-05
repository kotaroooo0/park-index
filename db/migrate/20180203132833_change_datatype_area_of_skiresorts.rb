class ChangeDatatypeAreaOfSkiresorts < ActiveRecord::Migration[5.1]
  def change
    change_column :skiresorts, :area_id, :integer
  end
end
