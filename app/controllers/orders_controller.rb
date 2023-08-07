class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @shipping_fee_statuses = ShippingFeeStatus.all
    @order_address = OrderAddress.new
  end
end
