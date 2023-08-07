class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @item = Item.find(params[:item_id])
    @shipping_fee_statuses = ShippingFeeStatus.all
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_address_params)
    if @order_address.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      @shipping_fee_statuses = ShippingFeeStatus.all
      render :index, status: :unprocessable_entity
    end
  end

  private
  def order_address_params
    params.require(:order_address).permit(:postal_code, :shipping_prefecture_id, :city, :addresses, :building, :phone_number).merge(item_id: params[:item_id], user_id: params[:user_id])
  end
end
