class Address < ActiveRecord::Base
  has_many :event_locations
  has_one :profile
  has_one :business

  geocoded_by :address
  after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }

  def address
    [city, zipcode, streetName, streetNumber].compact.join(', ')
  end



  def address_changed?
    attrs = %w(city zipcode streetName streetNumber)
    attrs.any?{|a| send "#{a}_changed?"}
  end


end


