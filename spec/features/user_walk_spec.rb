require 'rails_helper'

describe 'user walk' do
  let(:user) { create :user, email: 'rc@example.com', password: 12345678 }
  before { user }

  describe 'edit' do
    before do
      visit '/user/edit'
      expect(page.current_path).to eq '/users/sign_in'
      fill_in 'user_email', :with => 'rc@example.com'
      fill_in 'user_password', :with => '12345678'
      click_button 'Log in'
    end

    it 'should be on the edit page' do
      expect(page.current_path).to eq '/user/edit'
    end

    context 'when heap ID is set' do
      it 'should have heap' do
        expect(page.body).to include 'heap.identify'
      end
    end
  end
end