class Quote < ApplicationRecord
  belongs_to :customer
  belongs_to :employee
  belongs_to :vehicle
  belongs_to :user
end
