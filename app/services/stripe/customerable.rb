module Stripe
  module Customerable
    extend ActiveSupport::Concern

    included do
      has_many :remote_keys, as: :remoteable
      # has_one   :stripe_customer, -> { stripe_customers.order('id desc') }, class_name: 'RemoteKey', as: :remoteable
    end

    def stripe_customer
      @stripe_customer ||= remote_keys.stripe_customers.order('id desc').first&.retrieve
    end

    def stripe_subscriptions
      stripe_customer&.subscriptions || []
    end

    def active_stripe_subscriptions
      stripe_subscriptions.select { |s| s.status == 'active' }
    end

    def active_stripe_subscription?
      active_stripe_subscriptions.any?
    end
  end
end
