class Event < ActiveRecord::Base
  resourcify
  belongs_to :event_location
  belongs_to :who_has_access_to_event

  has_many :event_hosts
  has_many :profiles, through: :event_hosts
  has_many :businesses, through: :event_hosts
  has_many :services, through: :event_hosts

  has_many :guestlist_details
  has_many :guestlists
  has_many :users, through: :guestlists

  has_many :event_images, :dependent => :destroy

  has_many :event_event_genres
  has_many :event_genres, through: :event_event_genres

  validates :name, presence: true
  validates_length_of :name, maximum: 100
  validates_length_of :teaser, maximum: 200
  validates :who_has_access_id, presence: true
  validates :date, presence: true
  validates_format_of :time, :with => /(((([0]?|[1])[0-9])|([2][0-3])):([0-5])([0-9]))/, message: "hat ein ungültiges Format (Beispiel: 21:30)"
  validate :end_time, :check_end_time

  validate :password_required?

  def password_required?
    if self.password.empty? && self.who_has_access_id == 2
      errors.add(:base, "Es muss ein Passwort eingegeben werden")
    end
  end

  def check_end_time
    unless self.end_time == ""
      validates_format_of :end_time, :with => /(((0?[0-9])|(1[0-9])|(2[0-3])):[0-5][0-9])/, message: "hat ein ungültiges Format (Beispiel: 21:30 oder leer lassen)"
    end
  end

  def flyer
    images = EventImage.where(event_id: self.id, album: "Flyer")
    if images.count > 0
      images.last.image
    else
      nil
    end
  end

  def upload
    images = EventImage.where(event_id: self.id).where(album: "Upload")
    if images.count > 0
      images.last.image
    else
      nil
    end
  end

  def guestlist_detail
    self.guestlist_details.last
  end

  def is_event_now?
    if self.date.present? && self.end_date.present? && self.time.present? && self.end_time.present?
      dtstart = DateTime.now.change(year: self.date.year, month: self.date.month, day: self.date.day, hour: self.time.to_time.hour, min: self.time.to_time.min)
      dtend = DateTime.now.change(year: self.end_date.year, month: self.end_date.month, day: self.end_date.day, hour: self.end_time.to_time.hour, min: self.end_time.to_time.min)
      if dtstart.past? && dtend.future?
        true
      else
        false
      end
    else
      false
    end
  end

end
