class CreateMusicians < ActiveRecord::Migration
  def change
    create_table :musicians do |t|
      t.boolean :hasEquipment
      t.integer :musicianType

      t.timestamps
    end
  end
end
