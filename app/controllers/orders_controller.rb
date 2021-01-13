class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :detect_item, only: [:index, :create]
  
  def index
    @order_form = OrderForm.new         #購入画面だしてる
    redirect_to root_path if @item.order.present? || @item.user_id == current_user.id
  end

  def create
    @order_form = OrderForm.new(order_form_params)      # 購入履歴作り   
    if @order_form.valid?
       pay_item
      @order_form.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def detect_item        #商品特定
    @item = Item.find(params[:item_id])
  end

  def order_form_params            
    params.require(:order_form).permit(:postal_code, :prefecture_id, :city, :address, :municipality, :building_name, :phone_number).merge(
      user_id: current_user.id, item_id: @item.id, token: params[:token])
  end
  
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_form_params[:token],
      currency: 'jpy'
    )
  end
end
