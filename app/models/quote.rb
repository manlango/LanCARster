class Quote < ApplicationRecord
  belongs_to :customer
  belongs_to :vehicle
  belongs_to :user

  after_save :markup_tax_calculation

  def markup_tax_calculation
    markup_percent = 0.082
    tax_percent = 0.043
    wholesale = vehicle.wholesale_price

    markup_total = wholesale * markup_percent
    tax_total = (wholesale + markup_total) * tax_percent
    total = wholesale + markup_total + tax_total
    update_columns(markup: markup_total, sales_tax: tax_total, total: total)
  end

  def vehicle_desc
    markup_percent = 0.082
    tax_percent = 0.043
    wholesale = vehicle.wholesale_price

    markup_total = wholesale * markup_percent
    tax_total = (wholesale + markup_total) * tax_percent
    total = wholesale + markup_total + tax_total
    "#{vehicle.vin} - #{vehicle.color} #{vehicle.make} #{vehicle.model}, #{vehicle.year}: $ #{total.round(2)}"
  end

end
