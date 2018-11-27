class ReportController < ApplicationController

  def index
    @quotes = Report.quote_all

  end

  def generate_report
    @quotes_select = Quote.find(params[:id])
    @years_select = params[:years]
    @rates_select = params[:rates]
    @payment_result = Report.monthly_payment(@quotes_select.total, @rates_select, @years_select)
    @amortization_table = Report.amortization_init(@quotes_select.total, @rates_select, @years_select)
  end
  private

end
