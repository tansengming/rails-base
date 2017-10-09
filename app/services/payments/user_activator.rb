module Payments
  class UserActivator
    attr_reader :stripe_token, :current_user

    def self.call(stripe_token, current_user)
      new(stripe_token, current_user).call
    end

    def initialize(stripe_token, current_user)
      @stripe_token = stripe_token
      @current_user = current_user
    end

    def call
      new_stripe_customer = Stripe::Customer.create({
        email: current_user.email,
        source: stripe_token
      })
  
      StripeCustomer.create! stripe_customer_id: new_stripe_customer.id, user: current_user
      current_user.update_attributes! active_until: 3.months.from_now
    end
  end
end