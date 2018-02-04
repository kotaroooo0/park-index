class AddSasUrlToSkiresorts < ActiveRecord::Migration[5.1]
  def change
    add_column :skiresorts, :sas_url, :string
  end
end
