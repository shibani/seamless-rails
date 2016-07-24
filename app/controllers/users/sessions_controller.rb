class Users::SessionsController < Devise::SessionsController
# before_filter :configure_sign_in_params, only: [:create]
  respond_to :html, :json

  #GET /resource/sign_in
  def new
    #super
  end

  #POST /resource/sign_in
  def create
    #super
    if signed_in?(resource_name)
      @user = User.find_by email: params[:user][:email]
      respond_to do |format|
        format.html { redirect_to "/users/#{@user.id}/#{@user.username}" }
        format.json { return render :status => 200, :json => { :user_id => @user.authentication_token } }
      end
    else
      @user = User.find_by email: params[:user][:email]
      respond_to do |format|
        format.html { redirect_to root_path, :notice => 'Login failed' }
        format.json { return render :status => 401, :json => { :errors => "Login failed" } }
      end
      #redirect_to root_path, :notice => 'Logged in successfully'
      #render "users/show"   
    end
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

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

  # def configure_permitted_parameters
  #   added_attrs = [:username, :email, :password, :password_confirmation, :remember_me]
  #   devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
  #   devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  # end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:username, :email, :password, :password_confirmation, :remember_me)
    end
  end

  def configure_account_update_params
      devise_parameter_sanitizer.for(:account_update)do |u|
        u.permit(:username, :email, :password, :password_confirmation, :remember_me)
    end
  end
end
