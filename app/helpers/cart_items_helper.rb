module CartItemsHelper
  def cart_item_existed? product_id
    CartItem.exists?(product_id: product_id)
  end

  def get_cart_items_price
    current_user.cart_items.sum do |cart_item|
      cart_item.product.price * cart_item.quantity
    end
  end
end
