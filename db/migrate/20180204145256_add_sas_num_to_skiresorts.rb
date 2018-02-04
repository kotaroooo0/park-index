class AddSasNumToSkiresorts < ActiveRecord::Migration[5.1]
  def change
    add_column :skiresorts, :sas_code, :string
  end
end
