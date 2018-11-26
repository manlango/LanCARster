class Vehicle < ApplicationRecord
  has_many :quotes
  has_one_attached :cover_photo

  def self.search(term)
    if term
      where('model iLIKE ?', "%#{term}%").order('id DESC')
    else
      order('id DESC')
    end
  end

end
