class UsersController < ApplicationController

  before_filter :authenticate_user_from_token!, :except => [:create, :show]
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

  def show_json
    if params[:id]
      #@user = User.find_by username: params[:username]
      @user = User.find(params[:id])
    end
  end

  def edit
  end

  def create
  end

  def user_info
    Rails.logger.debug "check: " + signin_params.inspect
    if request.post? or request.patch?
      if user_info_params
        @user = User.find_by(authentication_token: signin_params[:token])
        Rails.logger.debug "check: " + @user.id.inspect
        @user_info = UserInfo.find_by(user_id: @user.id)
        @user_info.update_attributes(firstname: user_info_params[:firstname], lastname: user_info_params[:lastname], primary_phone: user_info_params[:primary_phone], bill_address1: user_info_params[:address1], bill_address2: user_info_params[:address2], bill_city: user_info_params[:city], bill_state: user_info_params[:state], bill_zip: user_info_params[:zip])
        if @user_info.save
          Rails.logger.debug "check: saved"
          #respond_to json here, send success/failure msgs back to app
          respond_to do |format|
            format.html {  }
            format.json { render :json => { :status => 200, :message => "success", :userId => @user.id } }
          end
        end
      end
    end
  end

  def signup_params
    if params[:user]
      params.require(:user).permit(:email, :name, :username, :password, :form)  
    end
  end

  def signin_params
    if params[:user]
      params.require(:user).permit(:email, :token)  
    end
  end

  def user_info_params
    params.require(:user_info).permit(:firstname, :lastname, :address1, :address2, :city, :state, :zip, :primary_phone)
  end

  private
  
  def authenticate_user_from_token!
    user_email = params[:user][:email].presence
    user       = user_email && User.find_by_email(user_email)

    # Notice how we use Devise.secure_compare to compare the token
    # in the database with the token given in the params, mitigating
    # timing attacks.
    if user && Devise.secure_compare(user.authentication_token, params[:user][:token])
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