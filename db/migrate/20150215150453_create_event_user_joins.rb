class CreateEventUserJoins < ActiveRecord::Migration
  def change
    create_table :event_user_joins do |t|
      t.string :status

      t.timestamps
    end
  end
end
