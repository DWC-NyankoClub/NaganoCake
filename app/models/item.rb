class Item < ApplicationRecord
  belongs_to :genre
  has_many :cart_items, dependent: :destroy
  has_many :order_items, dependent: :destroy

  validates :name, presence: true
  validates :price, presence: true

  attachment :image



  def tax_included_price
    (price * 1.1).floor
  end
end
