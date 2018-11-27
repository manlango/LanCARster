class Report

  def self.quote_all
    Quote.all
  end

  def self.amortization_init(principal, rate, year)
    @principal_amt = principal
    @periods = year.to_i * 12
    @rate_per_period = (rate.to_f / 12) * 0.01
    @monthly_payment = monthly_payment(principal, rate, year)
    @amortization_table = []
    amortization_table
  end

  def self.monthly_payment(principal, rate, year)
    periods = year.to_i * 12
    rate_period = (rate.to_f / 12) * 0.01
    result = (rate_period * principal.to_f) / (1 - ((1 + rate_period) ** (-periods)))
  end

  private

  def self.amortization_table
    amortization_calculations
    @amortization_table
  end

  def self.amortization_calculations
    period_total = 1
    total_interest = 0
    total_principal = 0

    begin_bal = @principal_amt
    interest_portion = @principal_amt * @rate_per_period
    total_interest += interest_portion
    principal_portion = @monthly_payment - interest_portion
    total_principal += principal_portion
    ending_bal = begin_bal - principal_portion
    @amortization_table.push(period: period_total, beginning_balance: begin_bal, payment: @monthly_payment, interest_portion: interest_portion,
                             sum_interest: total_interest, principal_portion: principal_portion, sum_principal: total_principal, ending_balance: ending_bal)
    (@periods - 1).times do
      period_total += 1
      begin_bal = ending_bal
      interest_portion = begin_bal * @rate_per_period
      total_interest += interest_portion
      principal_portion = @monthly_payment - interest_portion
      total_principal += principal_portion
      ending_bal -= principal_portion
      @amortization_table.push(period: period_total, beginning_balance: begin_bal, payment: @monthly_payment, interest_portion: interest_portion,
                               sum_interest: total_interest, principal_portion: principal_portion, sum_principal: total_principal, ending_balance: ending_bal)


    end
  end
end