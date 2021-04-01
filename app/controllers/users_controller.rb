class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = find_user
    if current_user != @user
      redirect_to '/login'
    end
  end

  def new
    @user = User.new
  end

  def create
    user = User.create(user_params)
  end

  def edit
    @user = find_user
  end

  def update
    user = User.update(user_params)
  end

  def destroy
    user = find_user
    user.destroy
  end
end
