class MealPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def create?
    user.usertype == "cook"
  end

  def new?
    create?
  end

  def update?
    record.user == user
  end

  def edit?
    record.user == user
  end

  def destroy?
    update?
  end

  def publish?
    true
  end
end
