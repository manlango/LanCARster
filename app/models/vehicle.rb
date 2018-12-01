class Vehicle < ApplicationRecord
  has_many :quotes
  has_one_attached :cover_photo

  validates_numericality_of :wholesale_price, greater_than_or_equal_to: 0

  def vehicle_desc
    markup_percent = 0.082
    tax_percent = 0.043

    markup_total = wholesale_price * markup_percent
    tax_total = (wholesale_price + markup_total) * tax_percent
    total = wholesale_price + markup_total + tax_total
    "#{vin} - #{color} #{make} #{model}, #{year}: $ #{total.round(2)}"
  end

  def self.search(term)
    if term
      where('model iLIKE ?', "%#{term}%").order('id DESC')
    else
      order('id DESC')
    end
  end
end
