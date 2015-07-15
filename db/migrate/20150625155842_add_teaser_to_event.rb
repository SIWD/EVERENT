class AddTeaserToEvent < ActiveRecord::Migration
  def change
    add_column :events, :teaser, :string
  end
end
