class DropTableCuisineRestaurants < ActiveRecord::Migration
  def change
    drop_table :cuisine_restaurants 
  end
end
