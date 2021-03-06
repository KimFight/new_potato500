class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search
  before_action :search_store

  def set_search
  @stores = Store.all
  set_store_column
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
  end

  def search_store
    @p = Store.ransack(params[:q])
    @prefecture = Prefecture.where.not(id: 1)
  end

  def set_store_column
    @store_name = Store.select("store_name").distinct
  end

end
