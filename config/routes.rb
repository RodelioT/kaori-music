Rails.application.routes.draw do
  get 'search/index'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :products, only: [:index, :show] do
    collection do
      post :clear_shopping_cart
    end

    member do
      post :add_to_cart
      post :remove_from_cart
    end
  end

  resources :categories, only: [:show]
  resources :customers, only: [:create]
  # resources :search, only: [:show]

  get 'search', to: 'search#index', as: 'search'

  resources :carts
  get 'carts/checkout/processPayment', to: 'carts#process_payment', as: 'carts/processPayment'
  get 'carts/checkout'
  get 'carts/clear_shopping_cart', to: 'carts#clear_shopping_cart'

  root to: 'products#index'
end
