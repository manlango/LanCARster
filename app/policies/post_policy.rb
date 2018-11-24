class PostPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    user.present?
  end

  def create?
    user.present?
  end


     def update?
       return true if user.present? && user.admin?
       user.present? && user == post.user
     end

  def destroy?
    user.present? && user.admin?

  end

  # Inheriting from the application policy scope generated by the generator
  class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      else
        scope.where(title: true)
      end
    end
  end


  private
  def post
      record
  end


end