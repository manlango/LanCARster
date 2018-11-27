class Customer < ApplicationRecord

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.search(term)
    if term
      where('last_name iLIKE ?', "%#{term}%").order('id DESC')
    else
      order('id DESC')
    end
  end
end
