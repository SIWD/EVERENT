class Location < ActiveRecord::Base

  geocoded_by :address, :bounds => ['DE']
  after_validation :geocode, :if => :address_changed?

end
