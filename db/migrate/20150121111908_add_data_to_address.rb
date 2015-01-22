class AddDataToAddress < ActiveRecord::Migration
  def change
    add_column :addresses, :lat, :string
    add_column :addresses, :lng, :string
    add_column :addresses, :stateCode, :string
    add_column :addresses, :country, :string
  end
end
