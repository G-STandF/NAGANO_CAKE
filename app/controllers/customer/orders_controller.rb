class Customer::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def confirm
    @order_price = 0
    @cart_items = current_customer.cart_items
    @order_item = OrderItem.new
    @order = Order.new
    @order.payment_method = params[:order][:payment_method]
    if params[:order][:address_option] == "0" #自分の住所の場合
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:address_option] == "1" #登録済住所の場合
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    elsif params[:order][:address_option] == "2" #新しいお届け先の場合はアドレステーブルに保存まで
      @order.postal_code = params[:order][:postal_code]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]
      # if @address.save
      # else
      #   flash.now[:alert] = "新しいお届け先を入力してください。"
      #   @order = Order.new(order_params)
      #   render :new
      # end
    else
      flash.now[:alert] = "配送先を選択してください。"
      render :new
    end
  end

 def create
    @order = Order.new(order_params)
    @order.save
    @cart_items = current_customer.cart_items.all
    @cart_items.each do |cart_item|
      @order_item = OrderItem.new
      @order_item.order_id = @order.id
      @order_item.product_id = cart_item.product.id
      @order_item.product_count = cart_item.product_count
      @order_item.purchase_price = cart_item.product.with_tax_price
      @order_item.save
    end
    current_customer.cart_items.destroy_all
    redirect_to thanks_orders_path
 end

  def thanks
  end

  def index
    @orders = current_customer.orders.all.page(params[:page]).per(5).order(id: "DESC")
  end

  def show
    @order = current_customer.orders.find(params[:id])
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :total_price, :payment_method, :postal_code, :address, :name, :postage)
  end

end
