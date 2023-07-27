class ProductsController < ApplicationController
  def index
    @pagy, @products = pagy Product.newest
  end
end
