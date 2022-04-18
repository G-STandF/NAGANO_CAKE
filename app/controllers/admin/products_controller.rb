class Admin::ProductsController < ApplicationController
  def index
    @products = Product.page(params[:page])
  end

  def new
    @product = Product.new
  end

  def show
  end

  def edit
  end

  private

  def products_params
    params.require(:product).permit(:genre_id, :name, :introduction, :price, :is_sales, :image)
  end
end
