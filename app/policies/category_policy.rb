class CategoryPolicy < ApplicationPolicy

  def edit?
    user.admin? || user.employee?
  end

  def update?
    user.admin? || user.employee?
  end

end
