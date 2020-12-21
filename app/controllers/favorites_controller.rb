class FavoritesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def create
    @favorite = current_user.favorites.create(store_id: params[:store_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @store = Store.find(params[:store_id])
    @favorite = current_user.favorites.find_by(store_id: @store.id)
    @favorite.destroy
    redirect_back(fallback_location: root_path)
  end
end
