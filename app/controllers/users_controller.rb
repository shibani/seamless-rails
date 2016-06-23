class UsersController < ApplicationController

  #skip_before_filter :verify_authenticity_token, :if =>lambda{ params[:form] == "remote_signup" }
  #before_action :authenticate_user!, only: [:show]
  before_action :authenticate_user!

  def new
    @bodyclass = "signup"
    @user = User.new
  end

  def show
    if @user
      @user = User.find_by email: params[:username]
    end
  end

  def create
    #added as spam filter 
    #unless params[:user][:url].present? || params[:url].present?
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
            render '/users/create.json.erb'
          end
        elsif params[:form] == "remote_signup"
          if @user.save
            @notice = "Sign up was successful!"
            #render "remote_create"
            #render '/users/remote_create.json.erb', :locals =>  { restaurants: @restaurants}
            render '/users/create.json.erb'
          end
        end
      else
        @error = true
        Rails.logger.debug "check: " + @user.errors.inspect
        if signup_params[:form] == "signup"
          render "new"
        elsif signup_params[:form] == "remote_signup"
          @notice = "Sign up failed"
          
          #Rails.logger.debug "check: " + @user.errors.full_messages.inspect

          @user.errors.messages[:email] == ["is invalid"] ? @email_error1 = true : @email_error1 = false
          @user.errors.messages[:email] == ["already has an account associated with it"] ? @email_error2 = true : @email_error2 = false
          @user.errors.messages[:name] == ["is too short (minimum is 4 characters)"] ? @name_error1 = true : @name_error1 = false
          @user.errors.messages[:name] == ["is too long (maximum is 50 characters)"] ? @name_error2 = true : @name_error2 = false
          @user.errors.messages[:password] == ["can't be blank"] ? @pwd_error1 = true : @pwd_error1 = false
          @user.errors.messages[:password] == ["must be 8 characters or longer"] ? @pwd_error2 = true : @pwd_error2 = false

          #Rails.logger.debug "check: " + @user.errors.messages[:email].inspect

          Rails.logger.debug "check: " + @email_error1.inspect

          render '/users/create.json.erb'

        elsif params[:form] == "remote_signup"
          @notice = "Sign up failed"
          
          #Rails.logger.debug "check: " + @user.errors.full_messages.inspect

          @user.errors.messages[:email] == ["is invalid"] ? @email_error1 = true : @email_error1 = false
          @user.errors.messages[:email] == ["already has an account associated with it"] ? @email_error2 = true : @email_error2 = false
          @user.errors.messages[:name] == ["is too short (minimum is 4 characters)"] ? @name_error1 = true : @name_error1 = false
          @user.errors.messages[:name] == ["is too long (maximum is 50 characters)"] ? @name_error2 = true : @name_error2 = false
          @user.errors.messages[:password] == ["can't be blank"] ? @pwd_error1 = true : @pwd_error1 = false
          @user.errors.messages[:password] == ["must be 8 characters or longer"] ? @pwd_error2 = true : @pwd_error2 = false

          #Rails.logger.debug "check: " + @user.errors.messages[:email].inspect

          Rails.logger.debug "check: " + @email_error1.inspect

          render '/users/create.json.erb'
        end
      end
        else render "remote_create"
    #end
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

#error codes:
#01 - email - is invalid
#02 - email - already has an account associated with it
#03 - name - is too short (minimum is 4 characters)
#04 - name - is too long (maximum is 50 characters)
#05 - password - can't be blank
#06 - password - must be 8 characters or longer