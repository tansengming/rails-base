module Stripe
  module CustomerableHelper
    extend ActiveSupport::Concern

    included do
      before { StripeMock.start }
      after  { StripeMock.stop }
    end

    def make_customerable_with_subscription(user)
      stripe_customer = Stripe::Customer.create plan: StripeMock.create_test_helper.create_plan.id, source: StripeMock.create_test_helper.generate_card_token
      RemoteKey.create key: stripe_customer.id, remote_service: 'stripe', remote_type: 'customer', remoteable_id: user.id, remoteable_type: user.class
    end

    def make_customerable(user)
      stripe_customer = Stripe::Customer.create
      RemoteKey.create key: stripe_customer.id, remote_service: 'stripe', remote_type: 'customer', remoteable_id: user.id, remoteable_type: user.class
    end
  end
end