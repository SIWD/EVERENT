class CreateEventUserStatuses < ActiveRecord::Migration
  def change
    create_table :event_user_statuses do |t|
      t.string :status

      t.timestamps
    end
  end
end
