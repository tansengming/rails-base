class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :redirect_to_payments, if: :payment_required?

  def edit
  end

  private
  def payment_required?
    PaymentRequired.(current_user)
  end

  def redirect_to_payments
    redirect_to new_payment_path
  end
end