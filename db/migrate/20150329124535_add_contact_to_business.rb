class AddContactToBusiness < ActiveRecord::Migration
  def change
    add_reference :businesses, :contact, index: true
  end
end
