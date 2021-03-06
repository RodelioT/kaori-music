Rails.application.routes.draw do
  get 'charges/new'

  get 'charges/create'

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

  get 'search', to: 'search#index', as: 'search'

  resources :carts
  get 'carts/clear_shopping_cart', to: 'carts#clear_shopping_cart'
  get 'carts/checkout', to: 'carts#checkout'
  get 'carts/checkout/process_payment', to: 'carts#process_payment', as: 'carts/process_payment'

  resources :charges, only: [:new, :create]

  root to: 'products#index'
end
