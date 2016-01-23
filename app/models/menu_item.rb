class MenuItem < ActiveRecord::Base

  belongs_to :menu_item_type #fk

  delegate :restaurant, to: :menu_item_type

end
