require 'rails_helper'

describe 'Admin' do
  subject { page }
  let(:admin) { create(:admin_user, :password => '12345678', email: 'an_admin@example.com') }
  let(:super_admin) { create(:super_admin, password: 'super12345678') }

  before { admin }

  describe 'login' do
    before do
      visit "/super_admins"
      fill_in 'super_admin_email', :with => super_admin.email
      fill_in 'super_admin_password', :with => 'super12345678'
      click_button 'Login'
    end
    its(:current_path) { should == '/super_admins' }

    describe 'index page' do
      before { click_link 'Admin Users' }

      it { should have_content('an_admin@example.com') }

      describe 'updating the admin user' do
        before do
          first('.table_actions').click_link('Edit')
          fill_in 'Email', with: 'new_email@example.com'
          click_button 'Update Admin user'
        end

        it 'should update the admin' do
          expect(page).to have_content('Admin user was successfully updated.')
          expect(page).to have_content('new_email@example.com')
        end
      end

      describe 'walking around' do
        it 'should not crash' do
          click_link 'New Admin User'
          click_link 'Logout'
        end
      end
    end
  end
end