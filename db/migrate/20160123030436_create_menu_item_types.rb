class CreateMenuItemTypes < ActiveRecord::Migration
  def change
    create_table :menu_item_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
