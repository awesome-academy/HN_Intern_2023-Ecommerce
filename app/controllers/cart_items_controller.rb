class CartItemsController < ApplicationController
  before_action :require_login, only: %i(index create update)
  before_action :find_cart_item, only: :update

  def index
    @cart_items = current_user.cart_items.newest
  end

  def destroy; end

  def create
    return if cart_item_existed?(params[:cart_item][:product_id])

    create_cart_item
  end

  def update
    update_cart_item_quantity params[:option]

    redirect_to cart_path
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(*CartItem::ATTRIBUTES)
  end

  def create_cart_item
    cart_item = current_user.cart_items.new(cart_item_params)
    if cart_item.save
      flash[:success] = t("controller.cart_items.added.success")
    else
      flash[:danger] = t("controller.cart_items.added.fail")
    end
    redirect_to root_path
  end

  def require_login
    return if logged_in?

    flash[:danger] = t "controller.cart_items.login_needed"
    redirect_to login_path
  end

  def update_cart_item_quantity option
    if option == Settings.cart_item.update.option.minus
      if @cart_item.quantity == 1
        flash[:error] = t("controller.cart_items.update.quantity_invalid")
      else
        @cart_item.quantity -= 1
      end
    elsif option == Settings.cart_item.update.option.plus
      @cart_item.quantity += 1
    end
  end

  def find_cart_item
    @cart_item = CartItem.find_by id: params[:id]

    return if @cart_item

    flash[:error] = "controller.cart_items.not_found"
    redirect_to cart_path
  end
end
