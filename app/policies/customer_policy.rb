class CustomerPolicy < ApplicationPolicy
  def index?
    user.present?
    true
  end


  def new?
    user.present?
  end

  def create?
    user.present?
  end


  def update?
    user.present? && user.agent?

  end

  def destroy?
    user.present? && user.agent?
  end

end