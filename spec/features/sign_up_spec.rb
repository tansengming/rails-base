require 'rails_helper'
require Rails.root.join('spec/support/feature_spec_helpers')

describe 'Siging Up' do
  include FeatureSpecHelpers

  def fill_and_submit_sign_up_form(email = 'email@example.com', password = '12345678')
    visit '/'
    click_on 'Login'
    click_on 'Sign up'

    fill_in 'Email', with: email
    fill_in 'Password', with: password
    fill_in 'Password confirmation', with: password
    click_on 'Sign up'
  end

  skip 'should create a new user and redirect to the plans page' do
    expect { fill_and_submit_sign_up_form }.to change { User.count }.by(1)
    expect(page.current_path).to eq '/plans'
  end
end
