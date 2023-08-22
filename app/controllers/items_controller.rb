class ItemsController < ApplicationController

  def new
    @item = item.new
  end

  def create
    Item.create(item_params)
    redirect_to '/'
  end

  private
  def item_params
    params.require(:item).permit(:name, :image, :text)
  end
  
end
