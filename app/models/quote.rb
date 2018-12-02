class Quote < ApplicationRecord
  belongs_to :customer
  belongs_to :vehicle
  belongs_to :user

  after_save :update_prices
  # validates_numericality_of :total, greater_than_or_equal_to: 0

  def update_prices
    @wholesale =  vehicle.wholesale_price

    @markup_total = markup_calculation(@wholesale)
    @tax_total = tax_calculation(@wholesale)
    @total = @wholesale + @markup_total + @tax_total
    update_columns(markup: @markup_total, sales_tax: @tax_total, total: @total)
  end

  def markup_calculation(wholesale_price)
    markup_percent = 0.082
    wholesale_price * markup_percent
  end

  def tax_calculation(wholesale_price)
    tax_percent = 0.043
    sub_total = wholesale_price + markup_calculation(wholesale_price)
    sub_total * tax_percent
  end

  def vehicle_desc
    "#{vehicle.vin} - #{vehicle.color} #{vehicle.make} #{vehicle.model}, #{vehicle.year}: $ #{total.round(2)}"
  end

  private

end

