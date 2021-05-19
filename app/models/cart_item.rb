class CartItem < ApplicationRecord
  belongs_to :item
  belongs_to :customer

  def self.subtotal
    item.tax_included_price * quantity
  end
end
