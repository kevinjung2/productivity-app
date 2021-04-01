class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
    if current_user != @user
      redirect_to '/login'
    end
  end
end
