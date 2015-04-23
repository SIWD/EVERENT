class CreateEventEventGenres < ActiveRecord::Migration
  def change
    create_table :event_event_genres do |t|
      t.references :event, index: true
      t.references :event_genre, index: true

      t.timestamps
    end
  end
end
