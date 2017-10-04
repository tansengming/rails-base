require 'rails_helper'

RSpec.describe PaymentsController do
  let(:user) { create :user }
  before { sign_in user }

  describe 'new' do
    subject { get :new }

    it 'should be success' do
      expect(subject).to be_success  
    end

    context 'when user is signed out' do
      before { sign_out user }

      it 'should be success' do
        expect(subject).to_not be_success  
      end
    end
  end
end