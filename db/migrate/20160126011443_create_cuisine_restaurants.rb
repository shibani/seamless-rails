class CreateCuisineRestaurants < ActiveRecord::Migration
  def change
    create_table :cuisine_restaurants do |t|
      t.belongs_to :cuisine, index: true
      t.belongs_to :restaurant, index: true

      t.timestamps
    end
  end
end
