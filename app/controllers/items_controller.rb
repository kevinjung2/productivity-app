class ItemsController < ApplicationController
  def index
    redirect_if_not_logged_in
    @items = {}
    @categories = Category.all
    @categories.each do |category|
      @items["#{category.name}"] = category.items
    end
  end

  def show
    redirect_if_not_logged_in
    @item = Item.find_by(id: params[:id])
  end

  def new
    redirect_if_not_logged_in
    @item = Item.new
    @categories = Category.all
  end

  def create
    redirect_if_not_logged_in
    item = Item.create(item_params)
    redirect_to item, alert: "Successfully created item."
  end

  def edit
    redirect_if_not_logged_in
    @item = Item.find_by(id: params[:id])
    @categories = Category.all
  end

  def update
    redirect_if_not_logged_in
    item = Item.find_by(id: params[:id])
    item.update(item_params)
    redirect_to item, alert: "Successfully updated item."
  end

  def destroy
    redirect_if_not_logged_in
    item = Item.find_by(id: params[:id])
    name = item.name
    item.destroy
    redirect_to items_path, alert: "Successfully destroyed item: #{name}"
  end

  private

    def item_params
      params.require(:item).permit(:name, :description, :category_id)
    end
end
