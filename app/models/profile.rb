class Profile < ActiveRecord::Base

  belongs_to :user
  has_many :event_profiles
  has_many :events, through: :event_profiles
  validates :user_id, :firstname, :lastname, presence: true

  has_attached_file :photo, styles: { medium: "300x300>" },
                    :url => ":rails_root/public/assets/:class/:id/:style.:extension"

  validates_attachment_size :photo, :less_than => 5.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']

  def name_with_initial
    "#{firstname} #{lastname}"
  end
end
