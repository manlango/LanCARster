class Vehicle < ApplicationRecord
  has_many :quotes
  has_one_attached :cover_photo

  def vehicle_desc
    markup_percent = ".082"
    tax_percent = ".043"

    markup_total = wholesale_price * markup_percent.to_f
    tax_total = (wholesale_price + markup_total) * tax_percent.to_f
    total = wholesale_price + markup_total + tax_total
    "#{vin} - #{color} #{make} #{model}, #{year}: $ #{total.round(2)}"
  end
end
