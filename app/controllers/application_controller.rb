class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  acts_as_token_authentication_handler_for User, only: [:new, :create, :update, :destroy]

  before_action :configure_permitted_parameters, only: [:new, :create]
  before_filter :configure_account_update_params, only: [:update]

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u|
        u.permit(:username, :email, :password, :password_confirmation)
      end
  end

  def configure_account_update_params
    devise_parameter_sanitizer.for(:account_update)do |u|
        u.permit(:username, :email, :password, :password_confirmation)
    end
  end
end
