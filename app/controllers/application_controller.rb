class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception
  # before_filter :authenticate_user_from_token!
  # before_filter :authenticate_user!

  respond_to :json, :html

  protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }

  acts_as_token_authentication_handler_for User, only: [:new, :create, :update, :destroy]

  before_action :configure_permitted_parameters, if: :devise_controller?
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

  # This is our new function that comes before Devise's one
  #before_filter :authenticate_user_from_token!
  # This is Devise's authentication
  #before_filter :authenticate_user!

  def after_sign_in_path_for(resource)
    render "users/show"
  end
end
#Rails.logger.debug "check: " + slide_params.inspect