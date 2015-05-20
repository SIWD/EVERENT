class AddDataToAddress < ActiveRecord::Migration
  def change
    add_column :addresses, :latitude, :float
    add_column :addresses, :longitude, :float
    add_column :addresses, :stateCode, :string
    add_column :addresses, :country, :string
  end
end
