class ProductsController < ApplicationController

  before_action :initialize_session

  def index
    @products = Product.order(created_at: :desc).page(params[:page]).per(8)
    @categories = Category.all
  end

  def show
    @product = Product.find(params[:id])
    @categories = Category.all
  end

  def add_to_cart
    id = params[:id].to_i             # Convert the string to an integer

    unless session[:shopping_cart].include?(id)
      session[:shopping_cart] << id   # Add that integer to the cart
      redirect_to products_path       # Redirect it back, after the POST action
    end

  end

  def remove_from_cart
    id = params[:id].to_i # Convert the string to an integer
    session[:shopping_cart].delete(id)
    # redirect_to 'cart/show'
    redirect_to cart_path
  end

  # TODO: On the shopping cart page, use this to clear the cart
  # You'll probably need to move this into the cart controller
  # remember to add the actual link in the view to clear cart (remember to use method: :post)
  def clear_shopping_cart
    session[:shopping_cart] = nil
    redirect_to products_path
  end

  private

  def initialize_session
    session[:shopping_cart] ||= []
  end
end
