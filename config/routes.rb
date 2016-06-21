Rails.application.routes.draw do

  devise_for :users
  root to: 'site#home'

  get '/' => 'site#home' # *** instead of sessions#new ***
  #post   '/'   => 'sessions#create'
  post '/' => 'restaurant#list'

  get 'site/index'

  get 'site/show'

  get 'site/create'

  get 'list' => 'restaurant#list'

  get 'signup'  => 'users#new', :as => "new_user"

  post 'signup' => 'users#create', :as => "users"
  
  get 'remote_signup' => 'users#new'
  
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
