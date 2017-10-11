class UserPolicy < ApplicationPolicy
  def edit?
    !PaymentRequired.(user)
  end
end