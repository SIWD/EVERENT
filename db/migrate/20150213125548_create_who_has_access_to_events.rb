class CreateWhoHasAccessToEvents < ActiveRecord::Migration
  def change
    create_table :who_has_access_to_events do |t|
      t.string :who
      t.string :title
      t.string :icon

      t.timestamps
    end
  end
end
