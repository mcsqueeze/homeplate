class OrderPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end

  end
  def index?
    true
  end
  def new?
    true
  end
  def show?
true

  end
  def create?
true
  end

  def destroy?
true
  end
  def confirmation?
    true

  end
end
