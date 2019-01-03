require 'rails_helper'

RSpec.describe UsersController do
  include Stripe::CustomerableHelper

  before { make_customerable(user).add_stripe_subscription! }

  let(:user) { create :user }

  describe 'GET /user/edit' do
    subject(:get_edit) { visit '/user/edit' }

    before { sign_in user }

    it 'should visit the page' do
      get_edit
      expect(page).to have_current_path '/user/edit'
    end

    context 'when heap id exists' do
      before { configatron.heap.app_id = 'fake-id' }

      after  { configatron.heap.app_id = nil }

      it 'should have heap' do
        get_edit
        expect(page.body).to include 'heap.identify'
      end
    end

    context 'when not active' do
      before { make_customerable(user).remove_stripe_subscriptions! }

      it 'should redirect to plans' do
        get_edit
        expect(page).to have_current_path '/stripe/subscribe/plans'
      end
    end

    context 'when not logged in' do
      before { sign_out user }

      it 'should be redirected' do
        get_edit
        expect(page).not_to have_current_path '/user/edit'
      end
    end
  end
end
