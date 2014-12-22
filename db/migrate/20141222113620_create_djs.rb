class CreateDjs < ActiveRecord::Migration
  def change
    create_table :djs do |t|
      t.integer :maxCapacity
      t.references :userService
      t.references :category

      t.timestamps
    end
  end
end
