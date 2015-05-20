class CreateUserBusinesses < ActiveRecord::Migration
  def change
    create_table :user_businesses do |t|
      t.integer :position

      t.references :business, index: true
      t.references :user, index: true
      t.timestamps
    end
  end
end
