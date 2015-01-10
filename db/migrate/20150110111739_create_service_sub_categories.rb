class CreateServiceSubCategories < ActiveRecord::Migration
  def change
    create_table :service_sub_categories do |t|
      t.string :name
      t.references :serviceCategory, index: true

      t.timestamps
    end
  end
end
