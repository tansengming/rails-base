require 'ostruct'

module Stripe
  # TODO: spec this to match real Customerable
  module CustomerableTesting
    def stripe_subscriptions
      @customerable_testing_subscriptions ||= []
    end

    def add_subscription!
      @customerable_testing_subscriptions = [OpenStruct.new(status: 'active')]
    end

    def remove_subscriptions!
      @customerable_testing_subscriptions = []
    end
  end

  module CustomerableHelper
    def make_customerable(user)
      user.extend CustomerableTesting
    end
  end
end