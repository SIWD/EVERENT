class CreateAgbs < ActiveRecord::Migration
  def change
    create_table :agbs do |t|

      t.timestamps
    end
  end
end
