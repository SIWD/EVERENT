class CreateEventLocations < ActiveRecord::Migration
  def change
    create_table :event_locations do |t|
      t.string :name
      t.references :address, index: true

      t.timestamps
    end
  end
end
