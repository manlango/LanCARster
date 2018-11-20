class VehiclePolicy < ApplicationPolicy
  def index?
    true
  end





  def update?
   user.present? &&  user.inventory?
end

  def destroy?
    user.present? &&  user.inventory?
  end



end