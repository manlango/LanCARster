class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts
  has_many :vehicles
  has_many :departments
  has_many :employees
  has_many :quotes
  has_many :customers


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
