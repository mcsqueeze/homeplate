class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    true
  end

  def dashboard?
    true
  end

  def show?
    true
  end

  def change_usertype?
    true
  end
end
