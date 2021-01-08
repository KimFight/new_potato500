class ItemsController < ApplicationController
  before_action :authenticate_user!

  def index
    @items = Item.all
    @request = Request.new
  end

  def new
    if current_user.id == 1
      @item = Item.new
    else
      redirect_to items_path
    end
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to items_path
    else
      render :new
    end
  end

  def edit
    if current_user.id == 1
      @item = Item.find(params[:id])
    else
      redirect_to items_path
    end
  end
  
  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to items_path
    else
      render :edit
    end
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to items_path
  end


private

  def item_params
    params.require(:item).permit(:name, :introduction, :price, :item_image)
  end

end
