class ItemsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :edit]
  before_action :find_item, only: [:show, :edit, :update, :destroy]
  
  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def show
  end
  
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    if @item.destroy 
      redirect_to root_path
    else
      render :show
    end
  end

  def edit
    redirect_to root_path if @item.order.present? || @item.user_id != current_user.id
  end
  
  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end
  
  

  private
  def item_params
    params.require(:item).permit(:product_name,:product_description,:category_id,:condition_id,:shipping_charge_id,
    :prefecture_id,:days_to_ship_id,:price,:image).merge(user_id: current_user.id)
  end

  def find_item
    @item = Item.find(params[:id])
  end
end

