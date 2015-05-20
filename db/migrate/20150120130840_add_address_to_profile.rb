class AddAddressToProfile < ActiveRecord::Migration
  def change
    add_reference :profiles, :address, index: true
  end
end
