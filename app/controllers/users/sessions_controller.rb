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
        redirect_to root_path, :notice => 'Logged in successfully'
      else
        flash.now.alert = 'Login failed'
        render new
      end
    else
      if signed_in?(resource_name)
        return render :json => { :success => true }
      else
        return render :status => 401, :json => { :errors => resource.errors }
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
