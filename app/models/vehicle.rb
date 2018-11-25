class Vehicle < ApplicationRecord
  has_many :quotes
  has_one_attached :cover_photo

end
