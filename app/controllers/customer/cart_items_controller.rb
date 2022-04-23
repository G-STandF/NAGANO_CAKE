class Customer::CartItemsController < ApplicationController
  def index
    @cart_items = current_customer.cart_items
    @cart_item = CartItem.new
    @total = @cart_items.inject(0){|sum, product| sum + product.subtotal}
  end

  def create
    if customer_signed_in?
      if CartItem.find_by(product_id: cart_item_params[:product_id])
        @cart_item = CartItem.find_by(product_id: cart_item_params[:product_id])
        @cart_item.product_count += (cart_item_params[:product_count]).to_i
      else
        @cart_item = CartItem.new(cart_item_params)
        @cart_item.customer_id = current_customer.id
      end
      if @cart_item.save
       redirect_to cart_items_path
      else
       redirect_to products_path
      end
    else
      redirect_to new_customer_session_path
    end
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id]).destroy
    redirect_to cart_items_path
  end

  def destroy_all
    @cart_items = current_customer.cart_items
    @cart_items.destroy_all
    redirect_to cart_items_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:product_id, :product_count)
  end
end
