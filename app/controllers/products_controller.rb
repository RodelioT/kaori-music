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
    # Convert the string to an integer
    id = params[:id].to_i

    # If there are no products in the cart with the given ID
    if session[:shopping_cart].none? { |product| product["id"] == id }
      # Add hash to the cart
      session[:shopping_cart] << { "id" => id, "quantity" => 1 }
      # Redirect it back, after the POST action
      redirect_to products_path
    end
  end

  def remove_from_cart
    # Convert the string to an integer
    id = params[:id].to_i

    # Removes products that have the given ID
    session[:shopping_cart] = session[:shopping_cart].delete_if { |product| product["id"] == id }
    redirect_to cart_path
  end

  def clear_shopping_cart
    session[:shopping_cart] = nil
    redirect_to cart_path
  end

  private

  def initialize_session
    session[:shopping_cart] ||= []
  end
end
