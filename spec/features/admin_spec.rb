require 'spec_helper'

describe 'Admin' do
  subject { page }
  let(:admin) { create(:admin_user, :password => '12345678') }

  describe 'login' do
    before do
      visit "/admin"
      fill_in 'admin_user_email', :with => admin.email
      fill_in 'admin_user_password', :with => '12345678'
      click_button 'Login'
    end
    its(:current_path) { should == '/admin' }

    describe 'walking around the place' do
      before do
        click_link 'Users'
        click_link 'New User'
        click_link 'Logout'
      end

      it 'should not have an exception' do
         lambda { subject }.should_not raise_error
      end
    end
  end
end