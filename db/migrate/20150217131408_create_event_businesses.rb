class CreateEventBusinesses < ActiveRecord::Migration
  def change
    create_table :event_businesses do |t|
      t.references :event, index: true
      t.references :user, index: true
      t.references :event_user_status, index: true
      t.references :event_user_join, index: true

      t.timestamps
    end
  end
end
