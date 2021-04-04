class ShoppingListsController < ApplicationController
  def index
    @user = User.find_by(id: params[:user_id])
    redirect_to '/profile', alert: "you can only see your shopping lists" if @user != current_user

    @shopping_lists = @user.shopping_lists
  end

  def show
    @shopping_list = ShoppingList.find_by(id: params[:id])
    @categories = Category.all
    @items = {}
    #this finds all items in the shopping list and returns them to the variable @items in a hash structured as {"category name" -> <itemobj>}
    @categories.each do |category|
      item_array = []
      category.amounts.each do |amount|
        item_array << amount if @shopping_list.amounts.include?(amount)
      end
      @items["#{category.name}"] = item_array
    end
  end

  def edit
    @shopping_list = ShoppingList.find_by(id: params[:id])
    10.times do
      @shopping_list.amounts.build
    end
    @items = Item.all
    @user = current_user
  end

  def update
    # binding.pry
    shopping_list = ShoppingList.find_by(id: params[:id])
    shopping_list.update(shopping_list_params)
    redirect_to user_shopping_list_path(current_user, shopping_list)
  end

  def destroy

  end

  private

    def shopping_list_params
      params.require(:shopping_list).permit(:items, amounts_attributes: [:measurement, :item_name])
    end
end
