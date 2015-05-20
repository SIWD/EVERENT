class AddWhoHasAccessToEventToEvent < ActiveRecord::Migration
  def change
    add_reference :events, :who_has_access, index: true
  end
end
