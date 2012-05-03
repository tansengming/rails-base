require 'acceptance/acceptance_helper'

feature 'Admin walk', %q{
  just a walk through active admin to make sure nothing breaks from all the customizations we've made
} do

  background do
    admin = create(:admin_user, :password => '123456')
    AdminUser.count.should == 1

    visit "/admin"
    fill_in 'admin_user_email', :with => admin.email
    fill_in 'admin_user_password', :with => '123456'
    click_button 'Login'

    current_path.should == '/admin'
  end

  scenario 'walk on all indexes and new forms' do
    click_link 'Users'
    click_link 'New User'

    click_link 'Logout'
  end
end