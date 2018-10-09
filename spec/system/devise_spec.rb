require 'rails_helper'

describe 'devise' do
  it 'should show login page' do
    visit '/users/sign_in'
    expect(page.status_code).to eq 200
  end
end
