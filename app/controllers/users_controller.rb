class UsersController < ApplicationController

  def new
    @bodyclass = "signup"
    @user = User.new
  end

  def create
    @user = User.new(signup_params)

    if @user.valid?
      if signup_params[:form] == "signup" 
        if @user.save          
          flash[:success] = "Sign up was successful!"
        end
        redirect_to root_path 
      elsif signup_params[:form] == "remote_signup"
        if @user.save
          @notice = "Sign up was successful!"
          #render "remote_create"
          #render '/users/remote_create.json.erb', :locals =>  { restaurants: @restaurants}
          render '/users/remote_create.json.erb'
        end
      end
    else
      @error = true
      Rails.logger.debug "check: " + @user.errors.inspect
      if signup_params[:form] == "signup"
        render "new"
      elsif signup_params[:form] == "remote_signup"
        @notice = "Sign up failed"
        render '/users/remote_create.json.erb'
      end
    end
  end


  def remote_create
  end

  def signup_params
    if params[:user]
      params.require(:user).permit(:email, :name, :password, :form)  
    end
  end

#Rails.logger.debug "check: " + @path.inspect
end