Rails.application.routes.draw do
  get 'cart/checkout'
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
  get 'search', to: 'search#index', as: 'search'

  get 'cart', to: 'cart#show', as: 'cart'
  get 'cart/checkout/processPayment', to: 'cart#process_payment', as: 'cart/processPayment'

  resources :customers, only: [:create]

  root to: 'products#index'
end
