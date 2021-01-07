class OrdersController < ApplicationController
  before_action :authenticate_user!
 
  def index
    @item = Item.find(params[:item_id])
    # 入力フォーム用の空のインスタンス↓
    @order_purchase = OrderPurchase.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_purchase = OrderPurchase.new(order_params)

      if  @order_purchase.valid?
          pay_item
          binding.pry
          @order_purchase.save
          return redirect_to items_path
      else
          render 'index'
      end
   end

private

  def order_params
    params.require(:order_purchase).permit(:name, :prefecture_code, :postal_code, :city, :building, :phone_number, :purchase).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: params[:token], 
      currency: 'jpy'
      )
  end

end
