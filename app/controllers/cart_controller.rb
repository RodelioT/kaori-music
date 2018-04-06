class CartController < ApplicationController
  before_action :initialize_session
  before_action :load_shopping_cart
  before_action :load_subtotal

  def show
    @categories = Category.all


  end

  def checkout
    @categories = Category.all
    @provinces = Province.all
    @customer = Customer.new
  end

  def process_payment

  end

  private

  def initialize_session
    session[:shopping_cart] ||= []
  end

  def load_shopping_cart
    @shopping_cart_items = Product.find(session[:shopping_cart])
  end

  def load_subtotal
    @subtotal = 0
    @shopping_cart_items.each do |product|
      @subtotal += product.price
    end
  end
end
