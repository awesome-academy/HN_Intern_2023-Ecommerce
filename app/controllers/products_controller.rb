class ProductsController < ApplicationController
  before_action :find_product, only: :show

  def index
    @pagy, @products = pagy Product.price_descending,
                            items: Settings.page.items_12
  end

  def show; end

  private

  def find_product
    @product = Product.find_by id: params[:id]
    return if @product

    flash[:warning] = t "controller.products.not_found"
    redirect_to root_path
  end
end
