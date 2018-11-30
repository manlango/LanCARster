class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts
 has_many :vehicles
  has_many :departments


  has_many :customers


  def self.search(term)
    if term
      where('email iLIKE ?', "%#{term}%").order('id DESC')
    else
      order('id DESC')
    end
  end

def full_name
  "#{first_name} #{last_name}"
end

  def admin?
    role == "admin"
  end

  def agent?
    role == "agent"
  end

  def sales?
    role =="sales"
  end

  def finance?
    role == "finance"

  end

  def inventory?
    role == "inventory"

  end

end
