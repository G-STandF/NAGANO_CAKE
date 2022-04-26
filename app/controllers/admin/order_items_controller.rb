class Admin::OrderItemsController < ApplicationController
  def update
    @order_item = OrderItem.find(params[:id])
    @order = @order_item.order
    @order_items = @order.order_items
    if @order_item.update(order_item_params)
      @message = "製作ステータスを変更しました"
      if params[:order_item][:product_status] == "in_production"
        @order_item.order.order_status = "under_production"
        @order.save
      elsif @order.order_items.count == @order.order_items.where(product_status: "production_completed").count
        @order.order_status = "preparing"
        @order.save
      end
      # redirect_to admin_order_path(@order_item.order)
    else
      render :show
    end
  end

  private

  def order_item_params
    params.require(:order_item).permit(:product_status)
  end

end
