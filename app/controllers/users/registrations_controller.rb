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
 
    if resource.save
      #response.headers['Client-Id'] = @user.authentication_token
      #Rails.logger.debug "check: " + @user.authentication_token.inspect
      return render :json => { :success => true, :user_id => @user.authentication_token }
    else
      return render :status => 401, :json => { :errors => resource.errors }
    end
  end

  # PUT /resource
  # We need to use a copy of the resource because we don't want to change
  # the current user in place.
  # def update
  #   prev_unconfirmed_email = resource.unconfirmed_email if resource.respond_to?(:unconfirmed_email)
  #   logger.debug(params[:user])
  #   if resource.update_with_password(account_update_params)
  #     if is_navigational_format?
  #       update_needs_confirmation?(resource, prev_unconfirmed_email)
  #     end
  #     sign_in resource_name, resource
  #     return render :json => {success: true}
  #   else
  #     clean_up_passwords resource
  #     return render :status => 401, :json => {errors: resource.errors}
  #   end
  # end

  #@user = User.find_by_username(params[:username])
  #token.user = @user if _provided_valid_password? || _provided_valid_api_key?

  # def _provided_valid_password?
  #   params[:password] == 'foo password'
  # end

  # def _provided_valid_api_key?
  #   params[:api_key] == 'foo key'
  # end

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.for(:sign_up) << :attribute
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.for(:account_update) << :attribute
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end

  def account_update_params
    params.require(:user).permit( :email, :password, :password_confirmation, :current_password)
  end

  def sign_up_params
    params.require(:user).permit( :email, :username, :password, :password_confirmation)
  end
end
