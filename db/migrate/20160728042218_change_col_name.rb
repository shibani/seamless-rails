class ChangeColName < ActiveRecord::Migration
  def change
    rename_column :addresses, :address1, :address
  end
end
