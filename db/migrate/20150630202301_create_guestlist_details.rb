class CreateGuestlistDetails < ActiveRecord::Migration
  def change
    create_table :guestlist_details do |t|
      t.references :event, index: true
      t.boolean :active
      t.integer :size
      t.text :offer
      t.date :end_date
      t.string :end_time

      t.timestamps
    end
  end
end
