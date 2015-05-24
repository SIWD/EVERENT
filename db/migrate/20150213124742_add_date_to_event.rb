class AddDateToEvent < ActiveRecord::Migration
  def change
    add_column :events, :date, :date
    add_column :events, :time, :string
    add_column :events, :end_date, :date
    add_column :events, :end_time, :string
  end
end
