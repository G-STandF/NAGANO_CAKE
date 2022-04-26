class Admin::ProductsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @products = Product.page(params[:page])
  end

  def new
    @product = Product.new
    @genres = Genre.all
  end

  def create
    @product = Product.new(products_params)
    if @product.save
      redirect_to admin_product_path(@product)
    else
      flash.now[:alert] = "未入力の項目があります"
      render :new
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
    @genres = Genre.all
  end

  def update
    @product = Product.find(params[:id])
    @product.update(products_params)
    redirect_to admin_product_path
  end

  private

  def products_params
    params.require(:product).permit(:genre_id, :name, :introduction, :price, :is_sales, :image)
  end
end
