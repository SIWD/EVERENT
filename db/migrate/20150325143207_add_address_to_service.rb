class AddAddressToService < ActiveRecord::Migration
  def change
    add_reference :services, :address, index: true
    add_column :services, :sameAddressLikeBusiness, :boolean
  end
end
