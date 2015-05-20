class AddAttachmentImageToEventImages < ActiveRecord::Migration
  def self.up
    change_table :event_images do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :event_images, :image
  end
end
