Rails.application.routes.draw do

  devise_for :users
  root to: 'stores#index'

  resources :stores do
    resources :comments, only: [:create, :destroy] 
    resources :favorites, only: [:create, :destroy]
    collection do
      get 'search'
    end
  end
 
  resources :items do
    resources :orders, only: [:index, :create, :show]
  end

  # グッズ購入者から運営への要望
  resources :request, only: :create

end
