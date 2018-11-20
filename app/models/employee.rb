class Employee < ApplicationRecord
  belongs_to :department
  has_many :quotes
  belongs_to :user
end
