class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :phone
      t.string :mail
      t.string :fax
      t.string :mobilePhone

      t.timestamps
    end
  end
end
