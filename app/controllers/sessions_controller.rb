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

  def after_sign_in_path_for(resource)
    self.resource = warden.authenticate!(auth_options)
    set_flash_message!(:notice, :signed_in)
    sign_in(resource_name, resource)
    yield resource if block_given?
    respond_with resource, location: after_sign_in_path_for(resource)
    redirect_to "users/show"
  end

  def after_sign_in_path_for(resource)
    render "users/show"
  end

  protected

  def configure_permitted_parameters
    added_attrs = [:username, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end
