require 'rails_helper'
require 'pundit/rspec'

RSpec.describe UserPolicy do
  include Stripe::CustomerableHelper

  subject { described_class }
  let(:user) { make_customerable(User.new) }

  permissions :edit? do
    context 'when user has not paid' do
      before { user.remove_stripe_subscriptions! }

      it 'denies access' do
        expect(subject).not_to permit user
      end
    end

    context 'when user has paid' do
      before { user.add_stripe_subscription! }

      it 'grants access' do
        expect(subject).to permit user
      end

      context 'but payment has expired' do
        before { user.remove_stripe_subscriptions! }

        it 'denise access' do
          expect(subject).not_to permit user
        end
      end
    end
  end
end
