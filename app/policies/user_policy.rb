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
    record.user == user
  end

  def show?
    true
  end

  def change_usertype?
    true
  end
end
