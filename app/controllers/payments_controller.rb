class PaymentsController < ApplicationController
  before_action :authenticate_user!

  def new
  end

  def create
    stripe_token = params[:stripeToken]

    if stripe_token.nil?
      flash[:error] = 'There was a problem with the payment, please try again'
      redirect_to new_payment_path and return
    end

    begin
      new_stripe_customer = Stripe::Customer.create({
        email: current_user.email,
        source: stripe_token
      })
  
      StripeCustomer.create! stripe_customer_id: new_stripe_customer.id, user: current_user
      current_user.update_attributes! active_until: 3.months.from_now  
      redirect_to user_root_path and return
    rescue Stripe::InvalidRequestError
      flash[:error] = 'There was a problem with the payment, please try again'
    end

    redirect_to new_payment_path
  end
end