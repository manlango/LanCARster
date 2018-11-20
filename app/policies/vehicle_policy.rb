class VehiclePolicy < ApplicationPolicy
  def index?
    true
  end

  def create?
    user.present? && user.inventory?
  end


  def new?
    user.present? && user.inventory?
  end


  def update?
   user.present? &&  user.inventory?
end

  def destroy?
    user.present? &&  user.inventory?
  end



end