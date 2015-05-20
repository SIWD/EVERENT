class AddEventLocationToEvent < ActiveRecord::Migration
  def change
    add_reference :events, :event_location, index: true
  end
end
