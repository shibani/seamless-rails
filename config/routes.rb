Rails.application.routes.draw do

  root to: 'site#home' #instead of sessions#new

  get '/' => 'site#home' #instead of sessions#new

  get 'site/index'

  get 'site/show'

  get 'site/create'

  get    'signup'  => 'users#new', :as => "new_user"
  post   'signup'  => 'users#new', :as => "users"
  get    'login'   => 'sessions#new' 
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  get 'restaurants' => 'restaurant#index', :as => "restaurants"
  get 'restaurants/:name' => 'restaurant#show', :as => "show_restaurant"

  resources :restaurants do
    resources :cuisines
    resources :menu_item_types do
      resources :menu_items
    end
  end

end
