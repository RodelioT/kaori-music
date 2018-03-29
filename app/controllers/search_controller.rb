class SearchController < ApplicationController
  def index
    @search_terms = params[:q]
    @products = Product.where("name LIKE '%#{@search_terms}%'")

    @categories = Category.all
  end
end
