require 'rails_helper'

RSpec.describe 'Admin', type: :system do
  let(:admin) { create :admin_user }

  before { create :user }

  describe 'walking around the place' do
    before do
      sign_in admin
      visit '/admin'
    end

    it 'should not crash' do
      expect(page).to have_current_path '/admin'
      click_link 'User'
      click_link 'New User'
      click_link 'Cancel'
      click_link 'View'

      click_link 'Logout'
      expect { page }.not_to raise_error
    end
  end
end
