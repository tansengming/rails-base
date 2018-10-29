module Payments
  class Create
    attr_reader :stripe_token, :user, :plan_name

    def self.call(stripe_token: stripe_token, plan_name: plan_name, user: user)
      new(stripe_token, plan_name, user).call
    end

    def initialize(stripe_token, plan_name, user)
      @stripe_token = stripe_token
      @user         = user
      @plan_name    = plan_name
    end

    def call
      new_stripe_customer = Stripe::Customer.create(
        email: user.email,
        source: stripe_token,
        plan: plan_name
      )

      user.remote_keys.stripe_customers.create! key: new_stripe_customer.id
    end
  end
end
