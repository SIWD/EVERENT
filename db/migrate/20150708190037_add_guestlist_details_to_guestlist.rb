class AddGuestlistDetailsToGuestlist < ActiveRecord::Migration
  def change
    add_reference :guestlists, :guestlist_details, index: true
  end
end
