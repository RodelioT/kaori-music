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
    id = params[:id].to_i           # Convert the string to an integer
    session[:shopping_cart] << id   # Add that integer to the cart
    redirect_to products_path       # Redirect it back, after the POST action
  end

  def remove_from_cart

  end

  private

  def initialize_session
    session[:shopping_cart] ||= []
  end
end
