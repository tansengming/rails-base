require 'rails_helper'

RSpec.describe 'Payment Flow' do
  let(:user) { create :user }
  before { sign_in user }

  it do
    visit '/stripetk/plans'
    expect(page.current_path).to eq '/stripetk/plans'

    # pick a plan
    within '#nice-tip-plan' do
      click_on 'Get Started'
    end

    expect(page.current_path).to eq '/stripetk/payment/new'
    # Note: cannot fulfill payment because there is no way for me to
    # get a Strip token. Goes to failure path instead.
    click_on 'Pay $0.99 Every Month'
    expect(page.current_path).to eq '/stripetk/plans'
  end
end
