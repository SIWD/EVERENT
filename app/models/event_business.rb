class EventBusiness < ActiveRecord::Base
  belongs_to :event
  belongs_to :user
  belongs_to :event_user_status
  belongs_to :event_user_join
end
