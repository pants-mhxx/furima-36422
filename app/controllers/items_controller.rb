class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      redirect_to new_item_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :category_id, :item_state_id, :shipping_fee_id, :shipping_from_id,
                                 :shipping_day_id, :price, :image).merge(user_id: current_user.id)
  end
end
