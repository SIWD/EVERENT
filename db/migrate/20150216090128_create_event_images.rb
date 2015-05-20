class CreateEventImages < ActiveRecord::Migration
  def change
    create_table :event_images do |t|
      t.string :album
      t.references :event, index: true

      t.timestamps
    end
  end
end
