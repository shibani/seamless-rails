class MenuItemType < ActiveRecord::Base

  has_many :menu_items

  belongs_to :restaurant #fk

  accepts_nested_attributes_for :menu_items, :reject_if => :all_blank, :allow_destroy => true

end
