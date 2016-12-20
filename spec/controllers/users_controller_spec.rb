require 'rails_helper'

describe UsersController do
  let(:user) { create(:user) }

  describe 'GET /edit' do
    subject { get :edit }

    context 'after logging in' do
      before { sign_in user }
      it { should be_success }

      skip 'when heap ID is set' do
        render_views
        before { allow(App).to receive(:heap_app_id?) { true } }

        it 'should have heap' do
          expect(subject.body).to include 'heap.identify'
        end
      end

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