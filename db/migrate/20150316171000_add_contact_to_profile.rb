class AddContactToProfile < ActiveRecord::Migration
  def change
    add_reference :profiles, :contact
  end
end
