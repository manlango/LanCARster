class Quote < ApplicationRecord
  belongs_to :customer
  belongs_to :vehicle
  belongs_to :user

  after_save :markup_tax_calculation

  def markup_tax_calculation
    markup_percent = ".082"
    tax_percent = ".043"
    wholesale = vehicle.wholesale_price

    markup_total = wholesale * markup_percent.to_f
    tax_total = (wholesale + markup_total) * tax_percent.to_f
    total = wholesale + markup_total + tax_total
    update_columns(markup: markup_total, sales_tax: tax_total, total: total)
  end

end
