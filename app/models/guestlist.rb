class Guestlist < ActiveRecord::Base
  belongs_to :user
  belongs_to :event

  belongs_to :guestlist_detail

  def date
    self.event.date
  end

  def name
    self.user.profile.full_name.downcase
  end
end
