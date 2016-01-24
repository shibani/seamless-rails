class AddColumnsToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :info, :boolean
    add_column :restaurants, :billing, :boolean
    add_column :restaurants, :categories, :boolean
    add_column :restaurants, :items, :boolean
  end
end
