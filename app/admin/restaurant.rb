ActiveAdmin.register Restaurant do

  menu :label => "New Restaurant"

  menu :priority => 2

  filter :name
  filter :city

  permit_params :id, :name, :address1, :address2, :city, :state, :zip, :phone, :hours, :email, :website, :latitude, :longitude

  index do
    id_column
    column :name
    column :city
    column :state
    actions
  end

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
      end
    f.actions
  end

end

ActiveAdmin.register Restaurant, :as => 'Restaurant Detail' do

  filter :name
  filter :city

  index do
    id_column
    column :name
    column :city
    column :state
    actions
  end

  permit_params :owner, :accounts_payable, :bill_name, :bill_address1, :bill_address2, :bill_city, :bill_state, :bill_zip

  menu :label => "Restaurant Detail"

  menu :priority => 3

  form :html => {:multipart => true} do |f|
    f.inputs do
      f.input :owner 
      f.input :accounts_payable
      f.input :bill_name
      f.input :bill_address1
      f.input :bill_address2
      f.input :bill_city
      f.input :bill_state
      f.input :bill_zip
    end
    f.actions
  end

end

ActiveAdmin.register Restaurant, :as => 'Restaurant Menu Categories' do

  filter :name
  filter :city

  index do
    id_column
    column :name
    column :city
    column :state
    actions
  end

  # show do
  #   attributes_table do
  #     row :name
  #   end
  # end

  permit_params menu_item_types_attributes: [:id, :name, :_destroy]

  menu :label => "Restaurant Menu Categories"

  menu :priority => 4

  form :html => {:multipart => true} do |f|
    f.inputs do
      f.has_many :menu_item_types, new_record: 'Restaurant Menu Categories' do |b|
        b.input :name
        b.input :_destroy, :as => :boolean, :required => false, :label => 'Delete'
      end
    end
    f.actions
  end

end

ActiveAdmin.register Restaurant, :as => 'Restaurant Menu Items' do

  filter :name
  filter :city

  index do
    id_column
    column :name
    column :city
    column :state
    actions
  end

  permit_params menu_items_attributes: [:id, :name, :price, :description, :menu_item_type_id, :_destroy]

  menu :label => "Restaurant Menu Items"

  menu :priority => 5

  form :html => {:multipart => true} do |f|
    f.inputs do
      f.has_many :menu_items, new_record: 'Menu Item' do |b|
        b.input :name
        b.input :price
        b.input :description
        b.input :menu_item_type, as: :select, collection: MenuItemType.where(restaurant_id: params[:id])
        b.input :_destroy, :as => :boolean, :required => false, :label => 'Delete'
      end
    end
    f.actions
  end

end
