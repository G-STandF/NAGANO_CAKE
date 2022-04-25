class Customer::ProductsController < ApplicationController
  def top
    @products = Product.all.order(created_at: :desc).limit(4)
    @genres = Genre.all
  end

  def about
  end

  def index
    @products = Product.where(is_sales: true).page(params[:page])
    @genres = Genre.all
  end

  def show
    @product = Product.find(params[:id])
    @genres = Genre.all
    @cart_item = CartItem.new
  end

  private

  def cart_item_params
    params.require(:cart_items).permit(:product_id, :product_count)
  end
end
