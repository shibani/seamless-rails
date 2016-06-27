class SessionsController < ApplicationController

  def new
    #get login
  end

  def create
    #post login
  end

  def destroy
    #logout
  end

  protected

  def configure_permitted_parameters
    added_attrs = [:username, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end
