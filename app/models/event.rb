class Event < ActiveRecord::Base
  belongs_to :event_location
  belongs_to :who_has_access_to_event
  has_many :event_users
  has_many :users, through: :event_users
  has_many :event_businesses
  has_many :businesses, through: :event_businesses
  has_many :event_services
  has_many :services, through: :event_services
  has_many :users, through: :event_users
  has_many :event_images
end
