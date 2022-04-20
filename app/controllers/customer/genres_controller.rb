class Customer::GenresController < ApplicationController
  def show
    @genre = Genre.find(params[:id])
    @genres = Genre.all
    @products = Product.where(genre_id: @genre.id, is_sales: true).page(params[:page])
  end
end
