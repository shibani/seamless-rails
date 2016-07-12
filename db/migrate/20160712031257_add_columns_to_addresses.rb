class AddColumnsToAddresses < ActiveRecord::Migration
  def change
    add_column :addresses, :address1, :string
    add_column :addresses, :address2, :string
    add_column :addresses, :city, :string
    add_column :addresses, :state, :string
    add_column :addresses, :zip, :string
    add_column :addresses, :phone, :string
    add_column :addresses, :addresslabel, :string
  end
end
