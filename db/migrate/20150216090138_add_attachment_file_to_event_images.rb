class AddAttachmentFileToEventImages < ActiveRecord::Migration
  def self.up
    change_table :event_images do |t|
      t.attachment :file
    end
  end

  def self.down
    remove_attachment :event_images, :file
  end
end
