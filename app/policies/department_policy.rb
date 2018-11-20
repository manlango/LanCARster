class DepartmentPolicy < ApplicationPolicy
  def index?
    user.present?
    true
  end


  def create?
    user.present? && user.finance?
  end


  def update?
    user.present?

  end

  def destroy?
    user.present?
  end

end