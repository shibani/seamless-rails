class UsersController < ApplicationController

  def create

  end

  def new
    @user = User.new

    if request.post? or request.patch?
      @user = User.new(signup_params)

      if @user.valid?
        if @user.save            
          redirect_to root_path
        end
      else
        @error = true
      end 
    end
  end
end

def signup_params
  if params[:user]

  params.require(:user).permit(:email, :name, :password)  
  end
end

