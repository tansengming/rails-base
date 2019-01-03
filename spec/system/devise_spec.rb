require 'rails_helper'

RSpec.describe 'devise', type: :system do
  it 'should show login page' do
    visit '/users/sign_in'
    expect(page.status_code).to eq 200
  end
end
