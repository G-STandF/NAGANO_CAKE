class Admin::OrderItemsController < ApplicationController
  def updated
    @order = Order.find(params[:order_id])
    @order_items = @order.order_items
    @order_item = OrderItem.find(params[:id])

    if order_item.update(order_item_params)
      flash[:notice] = "製作ステータスを更新しました。"
    end

    if order_items.where(product_status: "製作完了").count == order_items.count
      order.update(order_status: "発送準備中")
    elsif order_items.where(product_status: "製作中").count >= 1
      order.update(order_status: "製作中")
    end

    redirect_to request.referer
  end

  private

  def order_item_params
    params.require(:order_item).permit(:product_status)
  end

end
