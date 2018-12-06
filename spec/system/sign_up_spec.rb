require 'rails_helper'

RSpec.describe 'User signing up', type: :system do
  def fill_and_submit_sign_up_form(email = 'email@example.com', password = '12345678')
    visit '/'
    click_on 'Login'
    click_on 'Sign up'

    fill_in 'Email', with: email
    fill_in 'Password', with: password
    fill_in 'Password confirmation', with: password
    click_on 'Sign up'
  end

  skip 'should create a new user' do
    expect { fill_and_submit_sign_up_form }.to change { User.count }.by(1)
  end

  skip 'should redirect to the plans page' do
    fill_and_submit_sign_up_form
    expect(page).to have_current_path('/plans')
  end
end
