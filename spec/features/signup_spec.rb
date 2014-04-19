require 'spec_helper'

describe 'signup' do
  it 'should show signup page' do
    visit '/auth'
  end

  it 'should show password reset' do
    visit "/auth/reset_password"
  end
end