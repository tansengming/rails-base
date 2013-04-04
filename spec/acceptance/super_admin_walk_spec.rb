require 'acceptance/acceptance_helper'

feature 'Super Admin walk', %q{
  just a walk through active admin to make sure nothing breaks from all the customizations we've made
} do

  background do
    admin = create(:admin_user, email: 'admin@example.com', password: '12345678')
    super_admin = create(:super_admin, password: 'super12345678')
    AdminUser.count.should == 1

    visit "/super_admins"
    fill_in 'super_admin_email', :with => super_admin.email
    fill_in 'super_admin_password', :with => 'super12345678'
    click_button 'Login'

    current_path.should == '/super_admins'
  end

  scenario 'walk on all indexes and new forms' do
    click_link 'Admin Users'
    page.should have_content('admin@example.com')
    click_link 'New Admin User'

    click_link 'Logout'
  end
end