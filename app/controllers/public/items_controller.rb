class Public::ItemsController < ApplicationController
  
  def index
    @items = Item.all
    @genre = Genre.find(params[:id]) if params[:id]
    @genres = Genre.all
  end
  
  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end
  
end
