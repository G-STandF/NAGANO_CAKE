class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @orders = Order.page(params[:page]).per(8).order(id: "DESC")

  end

  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items
  end

  def update
    @order = Order.find(params[:id])
    @order_items = @order.order_items
    @order_item = OrderItem.find(params[:id])
   if @order.update(order_params)
     @message = "注文ステータスを更新しました。"
     if @order.order_status == "paid_up"
          @order_items.each do |order_item|
            order_item.product_status = "waiting_production"
            order_item.save
          end
     end
    # binding.irb
        # redirect_to admin_order_path(@order)
   else
      render :show
   end
  end

  private

  def order_params
    params.require(:order).permit(:order_status)
  end
end
