class Profile < ActiveRecord::Base
  belongs_to :user, primary_key: "id", foreign_key: "user_id"
  validate :user_id, presence: true

  has_attached_file :photo, styles: { medium: "300x300>" },
                    :url  => "/assets/products/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/products/:id/:style/:basename.:extension"

  validates_attachment_presence :photo
  validates_attachment_size :photo, :less_than => 5.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']
end
