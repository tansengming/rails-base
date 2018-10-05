class UserPolicy < ApplicationPolicy
  def edit?
    paid?
  end
end
