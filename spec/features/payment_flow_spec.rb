require 'rails_helper'

RSpec.describe 'Payment Flow' do
  let(:user) { create :user, uid: 12345, provider: 'auth0' }
  before do
    OmniAuth.config.mock_auth[:auth0] = OmniAuth::AuthHash.new({
      provider: 'auth0',
      uid: user.uid,
      info: {email: user.email }
    })
  end

  after do
    OmniAuth.config.mock_auth[:auth0] = nil
  end

  def fill_and_submit_sign_up_form
    visit '/'
    click_on 'Login'
  end

  it do
    fill_and_submit_sign_up_form
    expect(page.current_path).to eq '/plans'

    # pick a plan
    click_on 'Nice Tip'
  
    expect(page.current_path).to eq new_payment_path
    # Note: cannot fulfill payment because there is no way for me to
    # get a Strip token. Goes to failure path instead.
    click_on 'Pay $0.99 Every Month'
    expect(page.current_path).to eq plans_path
  end
end
