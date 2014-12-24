class CreateProfils < ActiveRecord::Migration
  def change
    create_table :profils do |t|
      t.string :gender
      t.string :firstname
      t.string :lastname
      t.string :phone
      t.string :city
      t.string :postcode
      t.string :streetname
      t.string :housenumber
      t.references :user, index: true

      t.timestamps
    end
  end
end
