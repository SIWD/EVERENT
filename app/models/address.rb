class Address < ActiveRecord::Base
  has_many :event_locations
  has_one :profile
  has_one :business
  has_one :service

  validates :city, presence: true
  validates :street1, presence: true
  #validate :postalCode, :postalCodeLegal?

  geocoded_by :address
  after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }

  def address
    ["Stadt: " + city, postalCode, street1, street2].compact.join(', ')
  end


  def address_changed?
    attrs = %w(city postalCode street1 street2)
    attrs.any?{|a| send "#{a}_changed?"}
  end


  def postalCodeLegal?
    if postalCode.size == 0
      errors.add(:postalCode,'muss ausgefüllt werden')
=begin
    elsif postalCode.size < 5 || (false if Float(postalCode) rescue true)
      errors.add(:postalCode,'besteht aus 5 Ziffern')
=end
    end
  end


end


