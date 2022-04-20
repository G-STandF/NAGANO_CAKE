class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.page(params[:page]).per(10)
    
  end

  def show
    @order = Order.find(params[:id])
    
  end
  
  def updated
    
  end
  
  private
  
  def order_params
    params.require(:order).permit(:payment_method)
  end
end
