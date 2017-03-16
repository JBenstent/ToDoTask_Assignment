class TasksController < ApplicationController
  def homepage
    @user = User.find_by(id: session[:user_id])
    if @user
      render "homepage"
    else
      redirect_to "/user/login"
    end
  end

  def createtask
  end

  def updatetask
  end


end
