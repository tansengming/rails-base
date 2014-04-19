require 'spec_helper'

describe 'Admin' do
  subject { page }
  let!(:admin) { create(:admin_user, :password => '12345678', email: 'an_admin@example.com') }
  let(:super_admin) { create(:super_admin, password: 'super12345678') }

  describe 'login' do
    before do
      visit "/super_admins"
      fill_in 'super_admin_email', :with => super_admin.email
      fill_in 'super_admin_password', :with => 'super12345678'
      click_button 'Login'
    end
    its(:current_path) { should == '/super_admins' }

    describe 'walking around the place' do

      it 'should not have an exception' do
        click_link 'Admin Users'
        page.should have_content('an_admin@example.com')
        click_link 'New Admin User'
        click_link 'Logout'
      end
    end
  end
end

# require 'acceptance/acceptance_helper'

# feature 'Super Admin walk', %q{
#   just a walk through active admin to make sure nothing breaks from all the customizations we've made
# } do

#   background do
#     admin = create(:admin_user, email: 'admin@example.com', password: '12345678')
#     super_admin = create(:super_admin, password: 'super12345678')
#     AdminUser.count.should == 1

#     visit "/super_admins"
#     fill_in 'super_admin_email', :with => super_admin.email
#     fill_in 'super_admin_password', :with => 'super12345678'
#     click_button 'Login'

#     current_path.should == '/super_admins'
#   end

#   scenario 'walk on all indexes and new forms' do
#     click_link 'Admin Users'
#     page.should have_content('admin@example.com')
#     click_link 'New Admin User'

#     click_link 'Logout'
#   end
# end