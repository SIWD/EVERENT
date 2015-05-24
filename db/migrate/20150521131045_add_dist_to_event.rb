class AddDistToEvent < ActiveRecord::Migration
  def change
    add_column :events, :dist, :float
  end
end
