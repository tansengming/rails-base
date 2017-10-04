require 'rails_helper'

RSpec.describe 'Payment Flow' do
  def fill_and_submit_sign_up_form
    visit '/'
    click_on 'Sign Up'
    fill_in 'Email', with: 'email@example.com'
    fill_in 'Password', with: '12345678'
    fill_in 'Password confirmation', with: '12345678'
    click_on 'Sign up'
  end

  it do
    fill_and_submit_sign_up_form
    expect(page.current_path).to eq '/payment/new'
  
    click_on 'Submit Payment'
    expect(page.current_path).to eq '/user/edit'
  end
end
