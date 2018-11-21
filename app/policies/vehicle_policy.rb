class VehiclePolicy < ApplicationPolicy
  def index?
    true
  end

  def create?
    user.present? && user.inventory? || user.admin?
  end


  def new?
    user.present? && user.inventory?|| user.admin?
  end


  def update?
    user.present? &&  user.inventory?|| user.admin?
  end

  def destroy?
    user.present? &&  user.inventory?|| user.admin?
  end



end