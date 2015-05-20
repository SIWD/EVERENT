class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :gender
      t.string :firstname
      t.string :lastname
      t.references :user, index: true

      t.timestamps
    end
  end
end
