class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.text :description
      t.integer :maxCapacity
      t.string :name
      t.date :premiumServiceEnd
      t.string :teaser
      t.references :Business, index: true

      t.timestamps
    end
  end
end
