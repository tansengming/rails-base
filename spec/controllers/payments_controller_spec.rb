require 'rails_helper'

RSpec.describe PaymentsController do
  let(:user) { create :user }
  before { sign_in user }

  describe 'new' do
    subject { get :new }

    context 'when there is a selected plan' do
      subject { get :new, params: { plan: 'nice_tip' } }
      it 'should be success' do
        expect(subject).to be_successful
      end
    end

    context 'when there is not a selected plan' do
      it 'should be a redirect' do
        expect(subject).to redirect_to '/plans'
      end
    end

    context 'when user is signed out' do
      before { sign_out user }

      it 'should be success' do
        expect(subject).to_not be_successful
      end
    end
  end

  describe 'create' do
    before  { StripeMock.start }
    after   { StripeMock.stop }
    subject { post :create, params: params }
    before  { stripe_helper.create_plan(id: 'good_tip') }
    let(:stripe_helper)  { StripeMock.create_test_helper }
    let(:default_params) { { stripeToken: stripe_helper.generate_card_token, plan: 'good_tip' } }

    context 'when there is a valid stripe token and plan' do
      let(:params) { default_params }

      it 'should create a new stripe customer' do
        expect { subject }.to change { RemoteKey.count }.by(1)
        expect(user.reload.stripe_customer).not_to be_nil
        expect(subject).to redirect_to page_path('thanks')
        expect(user.stripe_customer.retrieve.subscriptions.data.map { |s| s.plan[:id] }).to eq ['good_tip']
      end
    end

    context 'when the plan does not exist' do
      let(:params) { default_params.merge(plan: 'does_not_exist') }

      it 'should not create a new stripe customer' do
        expect { subject }.not_to change { RemoteKey.count }
        expect(subject).to redirect_to new_payment_path
      end
    end

    context 'when the plan is disabled' do
      before { stripe_helper.create_plan(id: 'disabled') }
      before do
        Stripe.plan :disabled do |plan|
          plan.name     = 'Disabled'
          plan.amount   = 99
          plan.interval = 'month'
          plan.metadata = {
            enable: false
          }
        end
      end
      let(:params) { default_params.merge(plan: 'disabled') }

      it 'should not create a new stripe customer' do
        expect { subject }.not_to change { RemoteKey.count }
        expect(subject).to redirect_to new_payment_path
      end
    end

    context 'when the token is invalid' do
      let(:params) { default_params.merge(stripeToken: 'sk_test_fake') }

      it 'should not create a new stripe customer' do
        expect { subject }.not_to change { RemoteKey.count }
        expect(user.reload.stripe_customer).to be_nil
        expect(subject).to redirect_to new_payment_path
      end
    end

    context 'when the token is empty' do
      let(:params) { default_params.merge(stripeToken: nil) }

      it 'should not create a new stripe customer' do
        expect { subject }.not_to change { RemoteKey.count }
        expect(user.reload.stripe_customer).to be_nil
        expect(subject).to redirect_to new_payment_path
      end
    end
  end
end
