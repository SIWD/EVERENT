class EventService < ActiveRecord::Base
  belongs_to :event
  belongs_to :service
  belongs_to :event_user_status
  belongs_to :event_user_join
end