class Address < ApplicationRecord
  belongs_to :customer

  # validates :postcode,:address,:name, presence: true

  def reg_address
    "〒" + postcode + " " + address + " " + name
  end

end
