class AddColsToAddresses < ActiveRecord::Migration
  def change
    add_column :addresses, :firstname, :string
    add_column :addresses, :lastname, :string
    add_column :addresses, :cross_street, :string
    add_column :addresses, :instructions, :text
    rename_column :addresses, :addresslabel, :place_type
  end
end
