ActiveAdmin.register MenuItem do

  menu false

  filter :name

  permit_params :name, :price, :description, :menu_item_type

end
