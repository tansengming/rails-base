module PaymentRequirable
  extend ActiveSupport::Concern

  def payment_required?
    PaymentRequired.(current_user)
  end

  def redirect_to_payments
    redirect_to new_payment_path
  end
end