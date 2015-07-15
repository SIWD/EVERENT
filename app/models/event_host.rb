class EventHost < ActiveRecord::Base
  belongs_to :profile
  belongs_to :business
  belongs_to :service
  belongs_to :event
  belongs_to :event_user_status
  belongs_to :event_user_join

  def date
    self.event.date
  end
end
