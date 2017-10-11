module Payments
  class UserActivator
    attr_reader :stripe_token, :current_user, :plan_name

    def self.call(stripe_token, plan_name, current_user)
      new(stripe_token, plan_name, current_user).call
    end

    def initialize(stripe_token, plan_name, current_user)
      @stripe_token = stripe_token
      @current_user = current_user
      @plan_name    = plan_name
    end

    def call
      new_stripe_customer = Stripe::Customer.create({
        email: current_user.email,
        source: stripe_token,
        plan: plan_name
      })
  
      StripeCustomer.create! stripe_customer_id: new_stripe_customer.id, user: current_user
      current_user.update_attributes! active_until: 33.days.from_now # slightly over a month
    end
  end
end