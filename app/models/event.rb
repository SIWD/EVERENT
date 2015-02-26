class Event < ActiveRecord::Base
  resourcify
  belongs_to :event_location
  belongs_to :who_has_access_to_event

  has_many :event_profiles
  has_many :profiles, through: :event_profiles

  has_many :event_businesses
  has_many :businesses, through: :event_businesses

  has_many :event_services
  has_many :services, through: :event_services

  has_many :event_images

  validates :name, presence: true
  #validate :at_least_one_host
  validates :event_location_id, presence: true
  validates :who_has_access_id, presence: true




end
