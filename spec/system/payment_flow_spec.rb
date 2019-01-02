require 'rails_helper'

RSpec.describe 'Payment Flow', type: :system do
  before { sign_in user }

  let(:user) { create :user }

  it do
    visit '/stripe/subscribe/plans'
    expect(page).to have_current_path '/stripe/subscribe/plans'

    # pick a plan
    within '#nice_tip-plan' do
      click_on 'Get Started'
    end

    expect(page).to have_current_path '/stripe/subscribe/payment/new'

    # Note: cannot fulfill payment because there is no way for me to
    # get a Stripe token. Goes to failure path instead.
    click_on 'Submit Payment'
    expect(page).to have_current_path '/stripe/subscribe/plans'
  end
end
