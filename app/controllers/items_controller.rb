class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  
  def index
   # @items = Item.all
  end

  def new
    @item = Item.new
    
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :image, :text, :category_id, :sales_status_id, :shipping_fee_status_id, :prefecture_id, :scheduled_delivery_id, :price ).merge(user_id: current_user.id)
  end


  
end
