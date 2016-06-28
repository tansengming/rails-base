require 'rails_helper'

describe UsersController do
  include SecureEndpointHelper
  let(:user) { create(:user) }

  describe 'GET /edit' do
    subject { get :edit }

    context 'after logging in' do
      before { login_as user }
      it { should be_success }

      context 'when heap ID is set' do
        render_views
        before { allow(App).to receive(:heap_app_id?) { true } }

        it 'should have heap' do
          expect(subject.body).to include 'heap.identify'
        end
      end
    end

    context 'if not logged in' do
      before { logout }
      it { should be_redirect }
    end
  end
end