class Cuisine < ActiveRecord::Base

  has_many :cuisine_restaurants
  has_many :restaurants, through: :cuisine_restaurants

end
