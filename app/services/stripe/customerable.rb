module Stripe
  module Customerable
    # TODO: nil
    def stripe_customer
      @stripe_customer ||= RemoteKey.stripe_customers.order('id desc').where(remoteable_id: self.id).first.retrieve
    end

    def stripe_subscriptions
      stripe_customer.subscriptions
    end

    def active_stripe_subscriptions
      stripe_subscriptions.select{ |s| s.status == 'active' }
    end

    def active_stripe_subscription?
      active_stripe_subscriptions.any?
    end
  end
end