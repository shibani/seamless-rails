ActiveAdmin.register MenuItemType do

filter :name

permit_params :id, :name, :restaurant_id

end
