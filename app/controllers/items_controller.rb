class ItemsController < ApplicationController
  def index
     
  end

  def new
    @item = Item.new
  end


  private
   def item_params
    params.require(:item).permit(:goods, :item_text, :category_id, :condition_id, :postage_id, :area_id, :days_deliver_id, :price, :image).merge(user_id: current_user.id)
   end
   
end
