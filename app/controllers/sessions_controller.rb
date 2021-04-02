class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.find_by(name: params[:name])
    if user
      if user.authenticate(params[:password])
        session[:user_id] = user.id
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
