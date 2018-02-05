class AddAreaToParks < ActiveRecord::Migration[5.1]
  def change
    add_column :parks, :area, :integer
    add_column :parks, :picture, :string
  end
end
