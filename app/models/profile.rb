class Profile < ActiveRecord::Base
  belongs_to :user
  validate :user_id, presence: true

  has_attached_file :photo, styles: { medium: "300x300>" },
                    :url => ":rails_root/public/assets/:class/:id/:style.:extension"

  validates_attachment_presence :photo
  validates_attachment_size :photo, :less_than => 5.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']

  def name_with_initial
    "#{firstname} #{lastname}"
  end
end
