require 'rails_helper'

describe UsersController do
  let(:user) { create(:user) }

  describe 'GET /edit' do
    subject { get :edit }

    context 'after logging in' do
      before { sign_in user }
      it { should be_success }

      context 'and user is deleted' do
        before { user.delete }
        it { should be_redirect }
      end
    end

    context 'if not logged in' do
      before { sign_out user }
      it { should be_redirect }
    end
  end
end