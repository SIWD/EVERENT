class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :teaser
      t.string :name

      t.timestamps
    end
  end
end
