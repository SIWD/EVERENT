class EventImage < ActiveRecord::Base
  belongs_to :event

  has_attached_file :image, styles: { big_show: "1200x800>", banner: "1200x450>", event_index: "680x300>", thumb: "400x400>" },

                    :url => '/assets/:class/:id/:style/Flyer.:extension'
                    #:url => ":rails_root/public/assets/:class/:id/:style.:extension"

  validates_attachment_size :image, :less_than => 5.megabytes
  validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/jpg', 'image/png']

end
