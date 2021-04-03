class ShoppingListsController < ApplicationController
  def index
    @user = User.find_by(id: params[:user_id])
    redirect_to '/profile', alert: "you can only see your shopping lists" if @user != current_user

    @shopping_lists = @user.shopping_lists 
  end

  def show

  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

    def shopping_list_params

    end
end
