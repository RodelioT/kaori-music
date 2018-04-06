class CartController < ApplicationController
  before_action :initialize_session
  before_action :load_shopping_cart

  def show
    @categories = Category.all
  end

  def checkout

  end

  def clear_shopping_cart
    session[:shopping_cart] = nil
    redirect_to cart # TODO: Currently does nothing; make it go back to the cart page
  end

  private

  def initialize_session
    session[:shopping_cart] ||= []
  end

  def load_shopping_cart
    @shopping_cart_items = Product.find(session[:shopping_cart])
  end
end
