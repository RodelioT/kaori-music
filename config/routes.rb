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
  # resources :search, only: [:index]
  get 'search', to: 'search#index', as: 'search'

  # resources :cart, only: [:show]
  get 'cart', to: 'cart#show', as: 'cart'

  root to: 'products#index'

end
