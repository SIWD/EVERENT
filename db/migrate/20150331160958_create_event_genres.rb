class CreateEventGenres < ActiveRecord::Migration
  def change
    create_table :event_genres do |t|
      t.string :name

      t.timestamps
    end
  end
end
