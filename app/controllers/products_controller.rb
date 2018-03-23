class ProductsController < ApplicationController
  def index
    @products = Product.order(created_at: :desc).page(params[:page]).per(8)
    @categories = Category.all
  end

  def show
    @product = Product.find(params[:id])
    @categories = Category.all
  end
end
