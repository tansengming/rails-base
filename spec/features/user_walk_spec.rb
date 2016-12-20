require 'rails_helper'

describe 'user walk' do
  let(:user) { create :user }

  describe 'edit' do
    before do
      sign_in user
      visit '/user/edit'
    end

    it 'should be on the edit page' do
      expect(page.current_path).to eq '/user/edit'
    end

    it 'should have heap' do
      expect(page.body).to include 'heap.identify'
    end
  end
end