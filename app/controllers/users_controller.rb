class UsersController < ApplicationController
  def index
    redirect_if_not_logged_in
    @users = User.all
  end

  def show
    @user = current_user
    redirect_if_not_logged_in
    redirect_if_user_doesnt_match
  end

  def new
    redirect_if_logged_in
    @user = User.new
  end

  def create
    redirect_if_logged_in
    user = User.create(user_params)
    session[:user_id] = user.id
    redirect_to '/profile', alert: "Welcome"
  end

  def edit
    redirect_if_not_logged_in
    redirect_if_user_doesnt_match
    @user = find_user
  end

  def update
    redirect_if_not_logged_in
    user = User.update(user_params)
  end

  def destroy
    redirect_if_not_logged_in
    redirect_if_user_doesnt_match
    user = find_user
    user.destroy
  end

  private

    def user_params
      params.require(:user).permit(:name, :password, :password_confirmation, :birthday)
    end
end
