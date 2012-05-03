require 'acceptance/acceptance_helper'

feature 'Admin walk', %q{
  just a walk through active admin to make sure nothing breaks from all the customizations we've made
} do

  background do
    AdminUser.find_or_create_by_email('test@example.com', :password => '123456')
    AdminUser.count.should == 1
    AdminUser.first.email.should == 'test@example.com'
    visit "/admin"
    fill_in 'admin_user_email', :with => 'test@example.com'
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