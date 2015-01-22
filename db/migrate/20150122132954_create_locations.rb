class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :city
      t.string :zipcode
      t.float :lat
      t.float :lng
      t.string :stateCode
      t.string :country

      t.timestamps
    end
  end
end
