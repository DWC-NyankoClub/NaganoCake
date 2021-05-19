class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :item

  enum make_status: {着手不可:0, 製作待ち:1,  製作中:2, 製作完了:3}
  
  def subtotal
    self.item.tax_included_price * self.quantity
  end
end
