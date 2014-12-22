class CreateBands < ActiveRecord::Migration
  def change
    create_table :bands do |t|
      t.integer :maxCapacity
      t.integer :members
      t.references :userService, index: true
      t.references :category, index: true

      t.timestamps
    end
  end
end
