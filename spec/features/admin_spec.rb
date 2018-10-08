require 'rails_helper'

describe 'Admin' do
  subject { page }
  let(:admin) { create(:admin_user) }

  describe 'login' do
    before do
      sign_in admin
      visit '/admin'
    end
    its(:current_path) { should == '/admin' }

    describe 'walking around the place' do
      before do
        click_link 'User'
        click_link 'New User'
        click_link 'Logout'
      end

      it 'should not have an exception' do
        expect { subject }.not_to raise_error
      end
    end
  end
end
