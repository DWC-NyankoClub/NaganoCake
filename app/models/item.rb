class Item < ApplicationRecord
  belongs_to :genre
  has_many :cart_items, dependent: :destroy
  has_many :order_items, dependent: :destroy

  validates :name, presence: true
  validates :price, presence: true

  attachment :image

  def is_active_to_string
    if is_active == true
      "販売中"
    else
      "販売停止中"
    end
  end

  def tax_included_price
    tax_rate = 1.1
    price * tax_rate
  end
end
