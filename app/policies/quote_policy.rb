class QuotePolicy < ApplicationPolicy




  def index?
     user.present?

  end


  def create?
    user.present? && user.agent? || user.admin?
  end


  def edit
    user.present? && user.agent? || user.admin? || user.finance?

  end


  def update?
    return true if user.present? && user.admin?
    user.present? && user == quote.user

  end

  def destroy?
    return true if user.present? && user.admin?
    user.present? && user == quote.user
  end

  def new?
    user.present? && user.agent? || user.admin?
  end

def sold?
 user.present? && user.finance?||user.admin?
end


  def info?
    user.present? && user.agent? || user.admin?
  end




  private
  def quote
    record
  end

  end
