class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_params, only: [:index, :create]
  before_action :move_to_root_path
  before_action :set_public_key, only: [:index, :create]

  def index
    @shipping_fee_statuses = ShippingFeeStatus.all
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_address_params)
    if @order_address.valid?
      Payjp.api_key = ENV['PAYJP_SECRET_KEY']
      Payjp::Charge.create(
        amount: Item.find(params[:item_id]).price,
        card: order_address_params[:token],
        currency: 'jpy'
      )
      @order_address.save
      redirect_to root_path
    else
      @shipping_fee_statuses = ShippingFeeStatus.all
      render :index, status: :unprocessable_entity
    end
  end

  private

  def order_address_params
    params.require(:order_address).permit(:postal_code, :shipping_prefecture_id, :city, :addresses, :building, :phone_number).merge(
      token: params[:token], item_id: params[:item_id], user_id: current_user.id
    )
  end

  def find_params
    @item = Item.find(params[:item_id])
  end

  def move_to_root_path
    return unless @item.order || @item.user_id == current_user.id

    redirect_to root_path
  end

  def set_public_key
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
  end
end
