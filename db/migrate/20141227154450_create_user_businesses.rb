class CreateUserBusinesses < ActiveRecord::Migration
  def change
    create_table :user_businesses do |t|
      t.string :position
      t.references :User, index: true
      t.references :Business, index: true

      t.timestamps
    end
  end
end
