class AddColumnToLane < ActiveRecord::Migration[5.1]
  def change
    add_reference :lanes, :user, foreign_key: true
  end
end
