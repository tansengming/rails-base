require 'rails_helper'

RSpec.describe 'Payment Flow' do
  def fill_and_submit_sign_up_form
    visit '/'
    within '#sign_up_or_log_in' do
      click_on 'Sign Up'
    end
    fill_in 'Email', with: 'email@example.com'
    fill_in 'Password', with: '12345678'
    fill_in 'Password confirmation', with: '12345678'
    click_on 'Sign up'
  end

  it do
    fill_and_submit_sign_up_form
    expect(page.current_path).to eq '/plans'

    # pick a plan
  
    # Note: cannot fulfill payment because there is no way for me to
    # get a Strip token. Goes to failure path instead.
    click_on 'Submit Payment'
    expect(page.current_path).to eq new_payment_path
  end
end
