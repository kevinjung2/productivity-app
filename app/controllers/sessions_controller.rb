class SessionsController < ApplicationController

  def new
    if current_user
      redirect_to '/profile'
    end
    @user = User.new
  end

  def create
    user = User.find_by(name: params[:user][:name])
    if user
      if user.authenticate(params[:user][:password])
        session[:user_id] = user.id
        redirect_to '/profile', alert: "Welcome Back"
      else
        redirect_to '/login', alert: "Incorrect Password"
      end
    else
      redirect_to '/login', alert: "Name not found"
    end

  end

  def destroy
    session.destroy
    redirect_to '/login', alert: "You were successfully logged out"
  end

end
