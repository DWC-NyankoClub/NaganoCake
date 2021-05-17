class Public::OrdersController < ApplicationController
  
  def index
    @orders = current_customer.order
  end

  def new
    @order = Order.new
    @addresses = Address.all
  end 
  
  def show
    @orders = current_customer.order
    @order = Order.find(params[:id])
  end
  
  def create
  end
  
  def confirm
  end
  
  def complete
  end
  
  private
  
  def order_params
    params.require(:order).permit(:pay_type, :address, :postcode, :name )
  end
  
end

