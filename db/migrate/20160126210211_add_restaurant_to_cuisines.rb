class AddRestaurantToCuisines < ActiveRecord::Migration
  def change
    add_reference :cuisines, :restaurant, index: true
  end
end
