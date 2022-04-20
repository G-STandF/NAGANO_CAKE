class Customer::OrdersController < ApplicationController
  def new
    @oder = Order.new
  end

  def confirm
  end

  def thanks
  end

  def index
    @orders = current_customer.orders.all.page(params[:page]).per(5)
  end

  def show
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :total_price, :payment_method, :postal_code, :address, :name, :postage)
  end

end
