class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :city
      t.string :postalCode
      t.string :street1
      t.string :street2

      t.timestamps
    end
  end
end