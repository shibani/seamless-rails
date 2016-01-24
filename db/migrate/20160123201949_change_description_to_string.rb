class ChangeDescriptionToString < ActiveRecord::Migration
  def change
    change_column :menu_items, :description, :string
  end
end
