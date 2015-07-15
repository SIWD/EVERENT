class GuestlistDetail < ActiveRecord::Base
  belongs_to :event
  has_one :guestlist
end
