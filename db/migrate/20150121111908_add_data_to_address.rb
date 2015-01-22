class AddDataToAddress < ActiveRecord::Migration
  def change
    add_column :addresses, :lat, :float
    add_column :addresses, :lng, :float
    add_column :addresses, :stateCode, :string
    add_column :addresses, :country, :string
  end
end
