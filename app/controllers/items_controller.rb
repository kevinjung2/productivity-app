class ItemsController < ApplicationController
  def index
    @items = {}
    @categories = Category.all
    @categories.each do |category|
      @items["#{category.name}"] = category.items
    end
  end

  def show
    @item = Item.find_by(id: params[:id])
  end

  def new
    @item = Item.new
    @categories = Category.all
  end

  def create

  end

  def edit
    @item = Item.find_by(id: params[:id])
    @categories = Category.all
  end

  def update

  end

  def destroy

  end

  private

    def item_params

    end
end
