class AddDateToEvent < ActiveRecord::Migration
  def change
    add_column :events, :date, :date
    add_column :events, :time, :time
    add_column :events, :end_date, :date
    add_column :events, :end_time, :time
  end
end
