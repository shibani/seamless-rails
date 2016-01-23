class AddRestaurantToMenuItemType < ActiveRecord::Migration
  def change
    add_reference :menu_item_types, :restaurant, index: true
  end
end
