class EventProfile < ActiveRecord::Base
  belongs_to :event
  belongs_to :profile
  belongs_to :event_user_status
  belongs_to :event_user_join
end
