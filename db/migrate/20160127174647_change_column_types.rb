class ChangeColumnTypes < ActiveRecord::Migration
  def change
    change_column :restaurants, :latitude, :float
    change_column :restaurants, :longitude, :float
    change_column :menu_items, :price, :float
  end
end
