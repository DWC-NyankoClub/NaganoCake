class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!

  def top
    @orders = Order.page(params[:page]).per(10)
    @orders = Order.all
  end

  
  def about
  end
  

end