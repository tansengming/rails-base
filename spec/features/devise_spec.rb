require 'rails_helper'

describe 'devise' do
  it 'should show signup page' do
    visit '/users/sign_up'
    expect(page.status_code).to eq 200
  end

  it 'should show login page' do
    visit '/users/sign_in'
    expect(page.status_code).to eq 200
  end

  it 'should show password reset' do
    visit '/users/password/new'
    expect(page.status_code).to eq 200
  end
end