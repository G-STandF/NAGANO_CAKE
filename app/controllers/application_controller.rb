class ApplicationController < ActionController::Base
  before_action :set_search
  
  def set_search
    @search = Product.ransack(params[:q])
    @search_products = @search.result.page(params[:page])
  end
end
