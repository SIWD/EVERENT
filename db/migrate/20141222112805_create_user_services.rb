class CreateUserServices < ActiveRecord::Migration
  def change
    create_table :user_services do |t|
      t.text :description
      t.string :name
      t.date :premiumServiceEndDate
      t.string :teaser
      t.references :user, index: true

      t.timestamps
    end
  end
end
