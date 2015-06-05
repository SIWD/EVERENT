class CreateSimpleSites < ActiveRecord::Migration
  def change
    create_table :simple_sites do |t|

      t.timestamps
    end
  end
end
