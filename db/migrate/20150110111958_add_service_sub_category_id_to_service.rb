class AddServiceSubCategoryIdToService < ActiveRecord::Migration
  def change
    add_column :services, :serviceSubCategory_id, :integer
  end
end
