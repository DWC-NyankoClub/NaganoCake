class Public::HomesController < ApplicationController
  
  def top
    # limit=>指定した件数取得,order=>並び替え,desc=>降順
    @items = Item.limit(4).order(created_at: :desc)
    @genres = Genre.all
  end
    
  def about
  end
    
end
