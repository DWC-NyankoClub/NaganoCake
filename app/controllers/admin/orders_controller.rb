class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
    
  def show
    @order = Order.find(params[:id])
    @order_items = OrderItem.all
  end
  
  def update
    @order = Order.find(params[:id])
    if @order.update(order_params) && @order.confirm_deposit?
            @order.order_items.update_all(make_status: 1)
      redirect_to admin_order_path(@order)
    else
      render :show
    end    
  end
  
  private

  def order_item_params
    params.require(:order_item).permit(:quantity, :make_status, :price)
  end
  def order_params
    params.require(:order).permit(:buy_status)
  end  
  
end
