class EventGenre < ActiveRecord::Base
  has_many :event_event_genres
  has_many :events,through: :event_event_genres
end
