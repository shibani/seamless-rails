class AddMenuItemTypeToMenuItem < ActiveRecord::Migration
  def change
    add_reference :menu_items, :menu_item_type, index: true
  end
end
