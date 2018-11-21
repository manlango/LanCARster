class QuotePolicy < ApplicationPolicy
  def index?
     user.present?

  end


  def create?
    user.present? && user.agent? || user.admin?
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



  private
  def quote
    record
  end

end