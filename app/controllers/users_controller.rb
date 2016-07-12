class UsersController < ApplicationController

  before_filter :authenticate_user_from_token!, :except => [:create]
  #before_filter :authenticate_user!

  def new
    @bodyclass = "signup"
    @user = User.new
  end

  def show
    if params[:id]
      #@user = User.find_by username: params[:username]
      @user = User.find(params[:id])
    end
  end

  def create
  end

  def signup_params
    if params[:user]
      params.require(:user).permit(:email, :name, :username, :password, :form)  
    end
  end

  private
  
  def authenticate_user_from_token!
    user_email = params[:user_email].presence
    user       = user_email && User.find_by_email(user_email)

    # Notice how we use Devise.secure_compare to compare the token
    # in the database with the token given in the params, mitigating
    # timing attacks.
    if user && Devise.secure_compare(user.authentication_token, params[:user_token])
      sign_in user, store: false
    else
      redirect_to root_url, alert: "Not authorized" if !signed_in?
    end
  end
  #Rails.logger.debug "check: " + @path.inspect

  #error codes:
  #01 - email - is invalid
  #02 - email - already has an account associated with it
  #03 - name - is too short (minimum is 4 characters)
  #04 - name - is too long (maximum is 50 characters)
  #05 - password - can't be blank
  #06 - password - must be 8 characters or longer
end