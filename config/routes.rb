Rails.application.routes.draw do

  
  root to: 'site#home'

  get '/' => 'site#home' # *** instead of sessions#new ***
  post   '/'   => 'sessions#create'
  #post '/' => 'restaurant#list'
  #post '/' => 'users#show'

  get 'site/index'

  get 'site/show'

  get 'site/create'

  get 'list' => 'restaurant#list'

  devise_for :users, :controllers => { sessions: 'users/sessions', registrations: 'users/registrations' }

  get 'signup'  => 'users#new', :as => "new_user"

  post 'signup' => 'users#create', :as => "users"

  post 'user_info' => 'users#user_info', :as => "user_info"
  
  get 'remote_signup' => 'users#new'
  
  delete 'logout'  => 'sessions#destroy'

  get 'users/:id/:username' => 'users#show', :as => "user"

  get 'users/:id/:username/edit' => 'users#edit', :as => "edit_user"

  post 'show_json' => 'users#show_json', :as => "json_user"

  post 'add_address' => 'users#add_address' 
  
  
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
