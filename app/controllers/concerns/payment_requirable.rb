module PaymentRequirable
  extend ActiveSupport::Concern

  def payment_required?
    PaymentRequired.(current_user)
  end

  def redirect_to_plans
    redirect_to plans_path
  end
end