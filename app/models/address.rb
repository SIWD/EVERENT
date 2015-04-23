class Address < ActiveRecord::Base
  has_many :event_locations
  has_one :profile
  has_one :business
  has_one :service

  validates :city, presence: true
  validates :postalCode, presence: true
  validates :street1, presence: true

  geocoded_by :address
  after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }

  def address
    [city, postalCode, street1, street2].compact.join(', ')
  end



  def address_changed?
    attrs = %w(city postalCode street1 street2)
    attrs.any?{|a| send "#{a}_changed?"}
  end


end


