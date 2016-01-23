Rails.application.routes.draw do
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)


  resources :restaurants do
    resources :menu_item_types do
        resources :menu_items
      end
  end
  # resources :restaurants
  # resources :menu_item_types
end
