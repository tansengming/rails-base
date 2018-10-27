module Stripe
  module Customerable
    extend ActiveSupport::Concern

    included do
      has_many :remote_keys, as: :remoteable
      # has_one   :stripe_customer, -> { stripe_customers.order('id desc') }, class_name: 'RemoteKey', as: :remoteable
    end

    def stripe_customer
      @stripe_customer ||= if stripe_customer_id?
                             stripe_customer_remote_key.retrieve
                           else
                             nil
                           end
    end

    def stripe_subscriptions
      if stripe_customer?
        stripe_customer.subscriptions
      else
        []
      end
    end

    def active_stripe_subscriptions
      stripe_subscriptions.select { |subscription| subscription.status == 'active' }
    end

    def active_stripe_subscription?
      active_stripe_subscriptions.any?
    end

    private

    def stripe_customer_remote_key
      remote_keys.stripe_customers.order('id desc').first
    end

    def stripe_customer_id?
      stripe_customer_remote_key.present?
    end

    def stripe_customer?
      stripe_customer.present?
    end
  end
end
