class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :city
      t.string :zipcode
      t.string :streetName
      t.string :streetNumber

      t.timestamps
    end
  end
end