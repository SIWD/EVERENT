class Address < ActiveRecord::Base
  has_many :event_locations
  has_one :profile
  has_one :business

  validates :city, presence: true

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

