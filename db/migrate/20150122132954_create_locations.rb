class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :city
      t.string :zipcode
      t.string :lat
      t.string :lng
      t.string :stateCode
      t.string :country

      t.timestamps
    end
  end
end
