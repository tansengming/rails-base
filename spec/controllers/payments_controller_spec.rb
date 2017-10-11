require 'rails_helper'

RSpec.describe PaymentsController do
  let(:user) { create :user }
  before { sign_in user }

  describe 'new' do
    subject { get :new }

    it 'should be success' do
      expect(subject).to be_success  
    end

    context 'when user is signed out' do
      before { sign_out user }

      it 'should be success' do
        expect(subject).to_not be_success  
      end
    end
  end

  describe 'create' do
    before { StripeMock.start }
    after  { StripeMock.stop }
    let(:stripe_helper) { StripeMock.create_test_helper }
    subject { post :create, params: params }
    before { stripe_helper.create_plan(id: 'good_tip') }

    context 'when there is a valid stripe token and plan' do
      let(:params) { {stripeToken: stripe_helper.generate_card_token, plan: 'good_tip'} }

      it 'should create a new stripe customer' do
        expect { subject }.to change { StripeCustomer.count }.by(1)
        expect(user.reload.stripe_customer).not_to be_nil
        expect(subject).to redirect_to user_root_path
        expect(user.stripe_customer.retrieve.subscriptions.data.map{|s| s.plan[:id]}).to eq ['good_tip']
      end
    end

    context 'when the token is invalid' do
      let(:params) { {stripeToken: 'sk_test_fake'} }

      it 'should not create a new stripe customer' do
        expect { subject }.not_to change { StripeCustomer.count }
        expect(user.reload.stripe_customer).to be_nil
        expect(subject).to redirect_to new_payment_path
      end
    end

    context 'when the token is empty' do
      let(:params) { {stripeToken: nil} }

      it 'should not create a new stripe customer' do
        expect { subject }.not_to change { StripeCustomer.count }
        expect(user.reload.stripe_customer).to be_nil
        expect(subject).to redirect_to new_payment_path
      end
    end
  end
end
