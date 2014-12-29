class CreateUserBusinesses < ActiveRecord::Migration
  def change
    create_table :user_businesses do |t|
      t.string :position

      t.references :user, index: true
      t.references :business, index: true

      t.timestamps
    end
  end
end
