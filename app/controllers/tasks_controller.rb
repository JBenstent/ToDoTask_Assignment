class TasksController < ApplicationController
  def homepage
    @user = User.find_by(id: session[:user_id])
    if @user
      if session[:show_completed]
        @tasks = @user.tasks.order(date_due: :asc)
      else
        @tasks = @user.tasks.order(date_due: :asc).where(status: false)
      end
      render "homepage"
    else
      redirect_to "/user/login"
    end
  end

  def getcreatetask
    render 'createtask'
  end

  def postcreatetask
    @user = User.find_by(id: session[:user_id])
    Task.create(task: params[:task], status: false, date_due: params[:date_due], user: @user)
    redirect_to '/'
  end

  def updatetask
    @task = Task.find(params[:id])
    if @task.status == true
      @task.status = false
      @task.save
      redirect_to "/"
    else
      @task.status = true
      @task.save
      redirect_to "/"
    end
  end

  def toggle_visibility
    if session[:show_completed].nil?
      session[:show_completed] = true

    elsif session[:show_completed] == false
      session[:show_completed] = true

    elsif session[:show_completed] == true
      session[:show_completed] = false
      
    end

    redirect_to '/'
  end
end
