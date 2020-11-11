class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  def index
    if current_user.id == @item.user_id || @item.order.present?
      redirect_to root_path
    else 
    @order_address = OrderAddress.new
    end
  end

  def create
    @order_address = OrderAddress.new(order_address_params)
     if @order_address.valid?
       pay_item
       @order_address.save
       redirect_to root_path
     else
       render :index
     end
 
  end

  private

  def order_address_params
   params.require(:order_address).permit(:postal, :prefecture_id, :city, :address, :buil, :tel).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
   Payjp::Charge.create(
    amount: @item.price, 
    card: order_address_params[:token], 
    currency: 'jpy'
   )
  end
  def set_item
    @item = Item.find(params[:item_id])
  end
end
