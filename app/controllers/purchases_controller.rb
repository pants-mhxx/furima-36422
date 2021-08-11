class PurchasesController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @item = Item.find(params[:item_id])
  end

  def new
  end

  def create
  end

  private

  def purchase_params
    params.require(:purchase_address).permit(:zip, :shipping_from, :address_line1, :address_line2, :building, :telephone).merge(user_id: current_user.id, item_id: params[:item_id] )
  end
end
