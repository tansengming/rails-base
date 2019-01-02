require 'rails_helper'

RSpec.describe 'Super Admin', type: :system do
  let(:admin)       { create(:admin_user, email: 'an_admin@example.com') }
  let(:super_admin) { create(:super_admin) }

  before do
    admin
    sign_in super_admin
    visit '/super_admins'
    click_link 'Admin Users'
  end

  describe 'updating an admin from the index page' do
    it 'should not crash' do
      expect(page).to have_content('an_admin@example.com')

      first('.table_actions').click_link('Edit')
      fill_in 'Email', with: 'new_email@example.com'
      click_button 'Update Admin user'

      expect(page).to have_content('Admin user was successfully updated.')
      expect(page).to have_content('new_email@example.com')
    end
  end

  describe 'visiting new user page' do
    it 'should not crash' do
      click_link 'New Admin User'
    end
  end

  describe 'logging out' do
    it 'should not crash' do
      click_link 'Logout'
    end
  end
end
