class UsersController < ApplicationController
  def postlogin
    @user = User.find(username: params[:username], password: params[:password])
    if @user
      session[:user.id] = @user.id
      redirect_to "/homepage"
    else
      flash[:errors] = ["User not found"]
      redirect_to "/"
    end
  end

  def login
    render "login"
  end

  def registration
  end

  def validation
  end
end
