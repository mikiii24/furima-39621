class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :move_to_index, only: [:edit]
  before_action :find_params, only: [:show, :edit, :update]

  def index
    @items = Item.includes(:user).order('created_at DESC')
    @q = Item.ransack(params[:q])
    @items = @q.result
    @shipping_fee_statuses = ShippingFeeStatus.all
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

  def show
    @q = Item.ransack(params[:q])
    @items = @q.result
    @shipping_fee_statuses = ShippingFeeStatus.all
    @user = @item.user
    @categories = Category.all
    @sales_statuses = SalesStatus.all
    @prefectures = Prefecture.all
    @scheduled_deliveries = ScheduledDelivery.all
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    item = Item.find(params[:id])
    if item.user == current_user
      item.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def search
    @q = Item.ransack(params[:q])
    @items = @q.result
    @shipping_fee_statuses = ShippingFeeStatus.all
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :item_info, :category_id, :sales_status_id, :shipping_fee_status_id,
                                 :prefecture_id, :scheduled_delivery_id, :price).merge(user_id: current_user.id)
  end

  def move_to_index
    @item = Item.find(params[:id])
    if @item.order
      redirect_to action: :index
    elsif @item.user != current_user

      redirect_to action: :index
    end
  end

  def find_params
    @item = Item.find(params[:id])
  end
end
