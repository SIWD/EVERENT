class Address < ActiveRecord::Base
  has_many :profile
  has_many :business
  has_many :event_locations



=begin

  acts_as_mappable :auto_geocode=> {
                       :field => :zipcode,
                       :error_message => 'Adresse konnte nicht in Koordinaten aufgelöst werden'
                   }
=end
end

