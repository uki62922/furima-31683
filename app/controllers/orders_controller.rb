class OrdersController < ApplicationController
  before_action :authenticate_user!
  def index
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user_id || @item.order.present?
      redirect_to root_path
    else 
    @order_address = OrderAddress.new
    end
  end

  def create
    @item = Item.find(params[:item_id])
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
   Payjp.api_key = "sk_test_85194ef7a2fe701dd5757f27" 
   Payjp::Charge.create(
    amount: @item.price, 
    card: order_address_params[:token], 
    currency: 'jpy'
   )
  end
end
