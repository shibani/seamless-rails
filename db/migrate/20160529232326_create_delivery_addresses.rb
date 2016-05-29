class CreateDeliveryAddresses < ActiveRecord::Migration
  def change
    create_table :delivery_addresses do |t|
      t.string :firstname
      t.string :lastname
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :cross_street
      t.string :phone
      t.string :instructions
      t.string :place_label
      t.references :user, index: true

      t.timestamps
    end
  end
end
