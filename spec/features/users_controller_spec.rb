require 'rails_helper'

describe 'user walk' do
  subject { page }
  let(:user) { create :user }

  describe 'edit' do
    before do
      sign_in user
      visit '/user/edit'
    end

    its(:current_path) { should == '/user/edit' }

    it 'should have heap' do
      expect(page.body).to include 'heap.identify'
    end
  end
end