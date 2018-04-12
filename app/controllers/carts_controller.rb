class CartsController < ApplicationController
  before_action :initialize_session
  before_action :load_shopping_cart
  before_action :load_subtotal

  def index
    @categories = Category.all

    @products = []
    @shopping_cart_items.each do |product_hash|
      @products << { product: Product.find(product_hash["id"]), quantity: product_hash["quantity"] }
    end
  end

  # remove_from_cart is in the products controller

  # clear_shopping_cart is in the products controller

  def checkout
    @categories = Category.all
    @provinces = Province.all

    @customer = Customer.new
  end

  def process_payment
    @categories = Category.all
    # TODO: continue from here
  end

  private

  def initialize_session
    session[:shopping_cart] ||= []
  end

  def load_shopping_cart
    @shopping_cart_items = session[:shopping_cart]
  end

  def load_subtotal
    @subtotal = 0
    @shopping_cart_items.each do |product|
      @subtotal += Product.find(product["id"]).price
    end
  end
end
