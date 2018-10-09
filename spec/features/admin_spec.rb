require 'rails_helper'

describe 'Admin' do
  subject { page }
  let(:admin) { create :admin_user }
  let!(:user) { create :user }

  describe 'walking around the place' do
    it 'should not crash' do
      sign_in admin
      visit '/admin'
      expect(subject.current_path).to eq '/admin'

      click_link 'User'
      click_link 'New User'
      click_link 'Cancel'
      click_link 'View'

      click_link 'Logout'
      expect { subject }.not_to raise_error
    end
  end
end
