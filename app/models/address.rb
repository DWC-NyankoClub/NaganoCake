class Address < ApplicationRecord
  belongs_to :customer

  def reg_address
    "〒" + postcode + " " + address + " " + name
  end

end
