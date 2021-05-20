class Address < ApplicationRecord
  belongs_to :customer

  validates :postcode, presence: true
  validates :address, presence: true
  validates :name, presence: true

  def reg_address
    "〒" + postcode + " " + address + " " + name
  end

end
