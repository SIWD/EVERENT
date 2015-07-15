class Profile < ActiveRecord::Base

  belongs_to :user
  belongs_to :address
  belongs_to :contact
  has_many :event_hosts
  has_many :events, through: :event_hosts

  validates :user_id, :firstname, :lastname, presence: true
  validates :contact_id, presence: true
  validates :address_id, presence: true
  validates :birthday, presence: true


  enum gender: [:Herr, :Frau]


  has_attached_file :photo, styles: { event_index: "300x300>", thumb: "50x50>"},

                    :url => '/assets/:class/:id/:style/ProfilBild.:extension'
                    #:url => ":rails_root/public/assets/:class/:id/:style.:extension"

  validates_attachment_size :photo, :less_than => 5.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/jpg', 'image/png']

  def name_with_initial
    "#{firstname.first(1)} #{lastname}"
  end
  def full_name
    "#{firstname} #{lastname}"
  end

  def has_birthday?
    if Date.today.day == self.birthday.day && Date.today.month == self.birthday.month
      true
    else
      false
    end
  end

  def age
    age = Date.today.year - self.birthday.year

    if Date.today.month < self.birthday.month
      age = age - 1
    elsif Date.today.month == self.birthday.month &&
        Date.today.day < self.birthday.day
      age = age - 1
    end
    age
  end
end
