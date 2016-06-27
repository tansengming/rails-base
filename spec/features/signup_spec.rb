require 'spec_helper'

describe 'signup', js: true do
  it 'should show signup page' do
    visit '/auth'
    expect(page.status_code).to eq 200
  end

  it 'should show password reset' do
    visit "/auth/reset_password"
    expect(page.status_code).to eq 200
  end
end