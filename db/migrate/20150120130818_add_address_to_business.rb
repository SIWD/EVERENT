class AddAddressToBusiness < ActiveRecord::Migration
  def change
    add_reference :businesses, :address, index: true
  end
end
