class Customer::ProductsController < ApplicationController
  def top
    @products = Product.all.order(cerate_at: :desc).limit(4)
  end

  def about
  end

  def index
  end

  def show
  end

  private
  def cart_item_params
    params.require(:cart_items).permit(:product_id, :product_count)
  end
end
