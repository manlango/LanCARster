class QuotePolicy < ApplicationPolicy
  def index?
    return true if user.present? && user.admin?
    user.present? && user == quote.user
  end


  def create?
    user.present? && user.agent?
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