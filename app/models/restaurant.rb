class Restaurant < ActiveRecord::Base

  has_many :menu_item_types
  has_many :menu_items
  
  has_many :cuisine_restaurants
  has_many :cuisines, through: :cuisine_restaurants

  accepts_nested_attributes_for :menu_item_types, :reject_if => :all_blank, :allow_destroy => true

  accepts_nested_attributes_for :menu_items, :reject_if => :all_blank, :allow_destroy => true

  accepts_nested_attributes_for :cuisines, :reject_if => :all_blank, :allow_destroy => true

end
