class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.page(params[:page]).per(10)

  end

  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items

  end

  def updated
    @order = Order.find(params[:id])
    @order_items = @order.order_items
   if @order.update(order_params)
     flash[:notice] = "注文ステータスを更新しました。"
   end
   if @order.status == "入金確認"
     @order_items.update_all(product_status: 1)
     redirect_to request.referer
   end
  end

  private

  def order_params
    params.require(:order).permit(:order_status)
  end
end
