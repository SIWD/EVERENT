class Profile < ActiveRecord::Base

  belongs_to :user
  belongs_to :address
  belongs_to :contact
  has_many :event_profiles
  has_many :events, through: :event_profiles

  validates :user_id, :firstname, :lastname, presence: true
  validates :contact_id, presence: true
  validates :address_id, presence: true


  enum gender: [:Herr, :Frau]


  has_attached_file :photo, styles: { medium: "300x300>", thumb: "50x50>" },

                    :url => '/assets/:class/:id/:style/ProfilBild.:extension'
                    #:url => ":rails_root/public/assets/:class/:id/:style.:extension"

  validates_attachment_size :photo, :less_than => 5.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/jpg', 'image/png']

  def name_with_initial
    "#{firstname} #{lastname}"
  end
end
