class AddContactToService < ActiveRecord::Migration
  def change
    add_reference :services, :contact, index: true
    add_column :services, :sameContactLikeBusiness, :boolean
  end
end
