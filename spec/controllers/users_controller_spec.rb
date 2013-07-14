require 'spec_helper'

describe UsersController do
  include SecureEndpointHelper
  let(:user) { create(:user) }

  describe 'GET /edit' do
    subject { get :edit }

    context 'after logging in' do
      before { login_as user }
      it { should be_success }
    end

    context 'if not logged in' do
      before { logout }
      it { should be_redirect }
    end
  end
end