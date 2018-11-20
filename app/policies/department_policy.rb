class DepartmentPolicy < ApplicationPolicy
  def index?
    user.present?
    true
  end


  def new?
    user.present? && user.admin?
  end


  def create?
    user.present? && user.admin?
  end


  def update?
    user.present?

  end

  def destroy?
    user.present?
  end

end