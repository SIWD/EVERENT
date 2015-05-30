class CreateImpressums < ActiveRecord::Migration
  def change
    create_table :impressums do |t|

      t.timestamps
    end
  end
end
