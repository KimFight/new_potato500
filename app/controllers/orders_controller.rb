class OrdersController < ApplicationController
  before_action :authenticate_user!
 
  def index
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @order_purchase = OrderPurchase.new(order_params)

    if  @order_purchase.valid?
        @order_purchase.save
        return redirect_to root_path
    else
        render 'index'
    end
  end

private

  def order_params
    params.require(:order_purchase).permit(:name, :postal_code, :city, :building, :phone_number, :purchase).merge(user_id: current_user.id, item_id: @item.id)
  end

end
