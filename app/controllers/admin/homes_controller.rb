class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!

  # def top
  #   path = Rails.application.routes.recognize_path(request.referer)

  #   if path[:controller]=="admin/customers" && path[:action] == "show"
  #     @orders = Order.where(customer_id: path[:id])
  #   else
  #     @orders = Order.all
  #   end
  # end


  def top
    if params[:customer_id]
      #遷移してきたIDをカスタマーIDに入れて、whereで取得
      @orders = Order.where(customer_id: params[:customer_id])
    else
      #オーダーのデーター全部
      @orders = Order.page(params[:page]).per(10)
    end
    @orders_page = Order.page(params[:page]).per(10)
  end

end