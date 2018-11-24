class QuotePolicy < ApplicationPolicy


  def index?

  user.present?
  end


  def create?
    user.present? && user.agent? || user.admin?
  end


  def edit?
    user.present? && user.agent? || user.admin? || user.finance?
  end


  def update?
    user.present? && user.agent? || user.admin? || user.finance?


  end

  def destroy?
    user.present? && user.agent? || user.admin?

  end

  def new?
    user.present? && user.agent? || user.admin?
  end

def sold?
 user.present? && user.finance?||user.admin?
end

  def title1?
    user.present? && user.finance?||user.admin?||user.agent?
  end

  def title2?
    user.sales?
  end

  def info?
    user.present? && user.agent? || user.admin?
  end

  def finances?
    user.present? && user.finance?
  end

  class Scope < Scope
    def resolve
      if user.admin? || user.finance? || user.sales?
          if user.admin? || user.agent? || user.finance?
             scope.all
          else
             scope.where(sold: "Sold")
          end
      else  scope.where(user_id:user)
      end

end

     private
     def quote
    record
  end

     end
end

