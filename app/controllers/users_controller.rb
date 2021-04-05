class UsersController < ApplicationController
  def index
    redirect_if_not_logged_in
    @users = User.all
  end

  def show
    @user = current_user
    redirect_if_not_logged_in
  end

  def new
    redirect_if_logged_in
    @user = User.new
  end

  def create
    redirect_if_logged_in
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = user.id
      redirect_to '/profile', alert: "Welcome"
    else
      render :new
    end
  end

  def edit
    redirect_if_not_logged_in
    redirect_if_user_doesnt_match(params[:id])
    @user = find_user
  end

  def update
    redirect_if_not_logged_in
    if @user = User.update(user_params)
      redirect_to '/profile'
    else
      render :edit
    end
  end

  def destroy
    redirect_if_not_logged_in
    redirect_if_user_doesnt_match(params[:id])
    user = find_user
    user.destroy
  end

  private

    def user_params
      params.require(:user).permit(:name, :password, :password_confirmation, :birthday)
    end
end
