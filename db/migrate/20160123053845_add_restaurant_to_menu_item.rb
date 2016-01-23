class AddRestaurantToMenuItem < ActiveRecord::Migration
  def change
    add_reference :menu_items, :restaurant, index: true
  end
end
