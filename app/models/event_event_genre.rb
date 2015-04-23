class EventEventGenre < ActiveRecord::Base
  belongs_to :event
  belongs_to :event_genre
end
