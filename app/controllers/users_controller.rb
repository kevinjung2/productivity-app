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
    session[:user_id] = user.id
  end

  def edit
    @user = find_user
    if !current_user
      redirect_to "/login"
    end
    if @user != current_user
      redirect_to current_user, alert: "You cannot edit another users account"
    end
  end

  def update
    user = User.update(user_params)
  end

  def destroy
    user = find_user
    user.destroy
  end

  private

    def user_params
      params.require(:user).permit(:name, :password, :password_confirmation, :birthday)
    end
end
