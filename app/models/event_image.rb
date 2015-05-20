class EventImage < ActiveRecord::Base
  belongs_to :event

  has_attached_file :image, styles: { banner: "1200x450>", event_index: "210x300>", thumb: "50x50>" },

                    :url => '/assets/:class/:id/:style/Flyer.:extension'
                    #:url => ":rails_root/public/assets/:class/:id/:style.:extension"

  validates_attachment_size :image, :less_than => 5.megabytes
  validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/jpg', 'image/png']

end
