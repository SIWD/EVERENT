class Event < ActiveRecord::Base
  resourcify
  belongs_to :event_location
  belongs_to :who_has_access_to_event


  has_many :event_profiles
  has_many :profiles, through: :event_profiles

  has_many :event_businesses
  has_many :businesses, through: :event_businesses

  has_many :event_services
  has_many :services, through: :event_services

  has_many :event_images

  has_many :event_event_genres
  has_many :event_genres, through: :event_event_genres

  validates :name, presence: true
  validates_length_of :name, maximum: 100
  validates :event_location_id, presence: true
  validates :who_has_access_id, presence: true

  def flyer
    images = EventImage.where(event_id: self.id)
    if images.count > 0
      images.last.image
    else
      nil
    end
  end


end
