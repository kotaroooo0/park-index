class AddSasUrlToSkiresorts < ActiveRecord::Migration[5.1]
  def change
    add_column :skiresorts, :sas_url, :string
    add_column :skiresorts, :picture, :string
    add_column :skiresorts, :description, :text
  end
end
