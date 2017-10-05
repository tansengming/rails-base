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

    context 'when there is a valid stripe token' do
      let(:params) { {stripeToken: stripe_helper.generate_card_token} }

      it 'should create a new stripe customer' do
        expect { subject }.to change { StripeCustomer.count }.by(1)
        expect(user.reload.stripe_customer).not_to be_nil
      end
    end

    context 'when the token is invalid'
  end
end
