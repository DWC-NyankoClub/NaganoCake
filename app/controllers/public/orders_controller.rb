class Public::OrdersController < ApplicationController
  def index
  end

  def show
  end

  def new
    @order = Order.new
    @addresses = Address.all
  end

  def confirm
  end

  def complete
  end

end
