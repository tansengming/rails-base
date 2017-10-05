class PaymentsController < ApplicationController
  before_action :authenticate_user!

  def new
  end

  def create
    stripe_token = params[:stripeToken]
    new_stripe_customer = Stripe::Customer.create({
      email: current_user.email,
      source: stripe_token
    })

    StripeCustomer.create! stripe_customer_id: new_stripe_customer.id, user: current_user
    current_user.update_attributes! active_until: 3.months.from_now
    redirect_to user_root_path
  end
end