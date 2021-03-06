class CreateEventHosts < ActiveRecord::Migration
  def change
    create_table :event_hosts do |t|
      t.references :event, index: true
      t.references :profile, index: true
      t.references :business, index: true
      t.references :service, index: true
      t.references :event_user_status, index: true
      t.references :event_user_join, index: true

      t.timestamps
    end
  end
end
