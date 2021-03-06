class ItemsController < ApplicationController
  before_action :authenticate_user!, except:[:index, :show]
  before_action :set_item, only: [:edit, :show, :update, :destroy]

  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
    @comments = @item.comments.includes(:user).order(created_at: :desc)
  end

  def edit
    unless current_user.id == @item.user.id
      redirect_to root_path
    end  
  end

  def update
    
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    unless current_user.id == @item.user.id
      redirect_to root_path
    end 
    @item.destroy
    redirect_to root_path
  end



  private
   def item_params
    params.require(:item).permit(:goods, :item_text, :category_id, :condition_id, :postage_id, :area_id, :days_deliver_id, :price, :image).merge(user_id: current_user.id)
   end
   
   def set_item
    @item = Item.find(params[:id])
  end

end
