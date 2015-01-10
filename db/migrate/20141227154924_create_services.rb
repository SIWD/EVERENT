class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :name
      t.string :teaser
      t.text :description
      t.references :business, index: true

      t.timestamps
    end
  end
end
