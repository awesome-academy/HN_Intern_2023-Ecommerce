class ProductsController < ApplicationController
  before_action :find_product, only: :show
  before_action :require_login, only: %i(new create destroy update)

  def index
    @pagy, @products = pagy Product.newest,
                            items: Settings.page.items_12
  end

  def new
    @product = Product.new
  end

  def show; end

  def create
    @product = current_user.products.build product_params
    if @product.save
      flash[:sucess] = t "controller.products.create.success"
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy; end

  def update; end

  private

  def find_product
    @product = Product.find_by id: params[:id]
    return if @product

    flash[:warning] = t "controller.products.not_found"
    redirect_to root_path
  end

  def product_params
    params.require(:product).permit(*Product::ATTRIBUTES)
  end

  def require_login
    return if logged_in?

    flash[:danger] = t "controller.products.login_needed"
    redirect_to login_path
  end
end
