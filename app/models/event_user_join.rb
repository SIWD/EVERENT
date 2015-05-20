class EventUserJoin < ActiveRecord::Base
  has_many :event_users
  has_many :event_businesses
  has_many :event_services
end
