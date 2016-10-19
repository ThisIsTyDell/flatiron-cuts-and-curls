class AppointmentPolicy < ApplicationPolicy
  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      if user.admin?
        scope.all
      else
        scope.where(user: user)
      end
    end
  end
  
  def index?
    user.admin?
  end

  def show?
    user.admin? || user.employee? || record.try(:user) == user
  end

  def update?
    user.admin? || user.employee? || record.try(:user) == user
  end

  def destroy?
    user.admin? || user.employee? || record.try(:user) == user
  end
end
