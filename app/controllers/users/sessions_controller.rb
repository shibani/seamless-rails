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
    if request.format == "text/html" || request.content_type == "text/html"
      if signed_in?(resource_name)
        @user = User.find_by email: params[:user][:email]
        #redirect_to root_path, :notice => 'Logged in successfully'
        #render "users/show"
        redirect_to "/users/#{@user.id}/#{@user.username}"
      else
        @user = User.find_by email: params[:user][:email]
        redirect_to root_path, :notice => 'Login failed'
      end
    else
      if signed_in?(resource_name)
        @user = User.find_by email: params[:user][:email]
        return render :status => 200, :json => { :user_id => @user.authentication_token }
      else
        return render :status => 401, :json => { :errors => "Login failed" }
        #error cases: username and password do not match
      end
    end
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.for(:sign_in) << :attribute
  # end
end
