class Users::RegistrationsController < Devise::RegistrationsController
# before_filter :configure_sign_up_params, only: [:create]
# before_filter :configure_account_update_params, only: [:update]
  
  #skip_before_filter :verify_authenticity_token, , only: [:create], :if => Proc.new { |c| c.request.format == 'application/json' }
  #before_filter :validate_auth_token, :except => :new, :create

  respond_to :html, :json

  def new
    #flash[:info] = 'Registrations are not open yet, but please check back soon'

    super
    #redirect_to root_path
  end


  def create
    #flash[:info] = 'Registrations are not open yet, but please check back soon'
    #redirect_to root_path
    build_resource(sign_up_params)
    @user_info = UserInfo.create(params[:user_info])
    @user.user_info = @user_info
 
    if resource.save
      #response.headers['Client-Id'] = @user.authentication_token
      #Rails.logger.debug "check: " + @user.authentication_token.inspect
      respond_to do |format|
        format.html { redirect_to root_path }
        format.json { return render :status => 200, :json => { :user_id => @user.authentication_token, :user_simple_id => @user.id} }
      end
    else
      respond_to do |format|
        format.html { render "users/new" }
        format.json { return render :status => 401, :json => { :errors => resource.errors } }
      end
    end
  end

  def account_update_params
    params.require(:user).permit( :email, :password, :password_confirmation, :current_password)
  end

  def sign_up_params
    params.require(:user).permit( :email, :username, :password, :password_confirmation)
  end
end
