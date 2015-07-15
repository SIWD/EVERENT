class AddMinAgeToEvent < ActiveRecord::Migration
  def change
    add_column :events, :min_age, :integer
    add_column :events, :accept_children_formular, :boolean
  end
end
