class CreateBranchCategories < ActiveRecord::Migration
  def change
    create_table :branch_categories do |t|
      t.string :name

      t.timestamps
    end
  end
end
