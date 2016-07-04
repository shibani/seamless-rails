Rails.application.routes.draw do

  
  root to: 'site#home'

  get '/' => 'site#home' # *** instead of sessions#new ***
  #post   '/'   => 'sessions#create'
  #post '/' => 'restaurant#list'
  post '/' => 'users#show'

  get 'site/index'

  get 'site/show'

  get 'site/create'

  get 'list' => 'restaurant#list'

  devise_for :users, :controllers => { sessions: 'users/sessions', registrations: 'users/registrations' }

  # if Rails.env.production?
  #   devise_for :users, :controllers => { registrations: 'users/registrations' } 
  # else
  #   devise_for :users, :controllers => { sessions: 'users/sessions' }
  #   #devise_for :users, :controllers => { :registrations => "registrations", :sessions => "sessions" }  
  # end

  get 'signup'  => 'users#new', :as => "new_user"

  post 'signup' => 'users#create', :as => "users"
  
  get 'remote_signup' => 'users#new'
  
  delete 'logout'  => 'sessions#destroy'

  get 'users/:username' => 'users#show', :as => "user"
  
  
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
