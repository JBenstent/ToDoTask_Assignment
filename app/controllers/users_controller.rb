class UsersController < ApplicationController
  def postlogin

    @user = User.find_by(username: params[:username], password: params[:password])
    if @user
      session[:user_id] = @user.id
      redirect_to "/"
    else
      flash[:errors] = ["User not found"]
      redirect_to "/user/login"
    end
  end

  def login
    render "login"
  end

  def registration
    @user = User.find_by(username: params[:username], password: params[:password])
    if !@user
      @user = User.create(username: params[:username], password: params[:password])
      session[:user_id] = @user.id
      redirect_to "/"
    else
      flash[:errors] = ["User not found"]
      redirect_to "/user/login"
    end
  end

  def validation
  end

  def logout
    session[:user_id] = 0
    redirect_to "/user/login"
  end

end
