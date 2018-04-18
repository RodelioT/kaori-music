class CartsController < ApplicationController
  before_action :initialize_session
  before_action :load_shopping_cart
  before_action :load_subtotal

  def index
    @categories = Category.all

    insert_quantities
  end

  # aka the Checkout section
  def show
    @categories = Category.all
    @provinces = Province.all

    @customer = Customer.new
  end

  def update
    @categories = Category.all

    # Receives the POST ID and quantity
    id = params[:id].to_i
    entered_quantity = params[:q].to_i

    # Updates the product quantity within the cart session
    # for the product with the given ID
    session[:shopping_cart].each do |product_hash|
      if product_hash["id"] == id
        product_hash["quantity"] = entered_quantity
      end
    end

    insert_quantities
  end

  # remove_from_cart is in the products controller

  # clear_shopping_cart is in the products controller

  def process_payment
    @categories = Category.all
    # @amount = 500 # $5.00 in cents
    @amount = ((session[:subtotal].to_f * session[:taxrate].to_f / 100) + session[:subtotal].to_f) * 100
    @description = 'Description of Charge'
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
      @subtotal += (Product.find(product["id"]).price * product["quantity"].to_i)
    end
  end

  def insert_quantities
    @products = []
    @shopping_cart_items.each do |product_hash|
      @products << { product: Product.find(product_hash["id"]), quantity: product_hash["quantity"] }
    end
  end

end
