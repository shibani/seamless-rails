ActiveAdmin.register Restaurant do

filter :name
filter :city

permit_params :id, :name, :address1, :address2, :city, :state, :zip, :phone, :hours, :email, :website, :latitude, :longitude, :description, :owner, :accounts_payable, menu_item_types_attributes: [:id, :name], menu_items_attributes: [:id, :name, :price, :description, :menu_item_type_id, :_destroy]

form :html => {:multipart => true} do |f|
  #form do |f|
    f.inputs do
      f.input :name
      f.input :address1
      f.input :address2
      f.input :city
      f.input :state
      f.input :zip
      f.input :phone
      f.input :hours
      f.input :email
      f.input :website
      f.input :description 
      f.input :owner 
      f.input :accounts_payable

      f.inputs do
        f.has_many :menu_items, new_record: 'Menu Item' do |b|
          b.input :name
          b.input :price
          b.input :description
          b.input :menu_item_type, as: :select, collection: MenuItemType.where(restaurant_id: params[:id])
          b.input :_destroy, :as => :boolean, :required => false, :label => 'Delete'
        end
      end

    end
  f.actions
end



end
