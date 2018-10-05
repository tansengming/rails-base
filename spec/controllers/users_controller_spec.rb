require 'rails_helper'

describe UsersController do
  let(:user) { create(:user) }

  describe 'GET /edit' do
    subject { get :edit }

    context 'after logging in' do
      context 'and user is deleted' do
        before { user.delete }
        it { should be_redirect }
      end
    end
  end
end
