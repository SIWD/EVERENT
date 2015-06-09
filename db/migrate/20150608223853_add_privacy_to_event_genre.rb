class AddPrivacyToEventGenre < ActiveRecord::Migration
  def change
    add_reference :event_genres, :privacy, index: true
  end
end
