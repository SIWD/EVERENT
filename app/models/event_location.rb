class EventLocation < ActiveRecord::Base
  belongs_to :address
  has_many :events

  validates :name, presence: true
  validate :event_address

  def event_address
    if (self.address_id.nil?)
      errors[:base] << ("Mindestens 1 Gastgeber muss ausgewählt werden.")
    end
  end
end
