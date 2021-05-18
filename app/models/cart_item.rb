class CartItem < ApplicationRecord
  belongs_to :item
  belongs_to :customer

  def subtotal
    self.item.tax_included_price * self.quantity
  end
end
