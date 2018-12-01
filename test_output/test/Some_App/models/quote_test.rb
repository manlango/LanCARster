require 'test_helper'

class QuoteTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  # Ran calculations outside of app
  # numerical results as followed with rounding to 2 digits

  setup do
    @q = Quote.new
  end

  test "markup calculation is correct" do
    wholesale_price = 5000
    assert_equal(410, @q.markup_calculation(wholesale_price).round(2))
  end

  test "tax calculation is correct" do
    wholesale_price = 10000
    assert_equal(465.26, @q.tax_calculation(wholesale_price).round(2))
  end

  test "quote total cannot be negative" do
    @q.total = -5000
    assert !@q.valid?
  end

  test "calculation sum is correct" do
    wholesale_price = 12500.25
    markup = @q.markup_calculation(wholesale_price)
    tax = @q.tax_calculation(wholesale_price)
    total = wholesale_price + markup + tax
    assert_equal(14106.86, total.round(2))
  end
end
