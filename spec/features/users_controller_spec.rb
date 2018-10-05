require 'rails_helper'

describe 'users controller' do
  let(:user) { create :user, active_until: 1.year.from_now }

  describe 'GET /user/edit' do
    subject { visit '/user/edit' }

    context 'when logged in' do
      before { sign_in user }

      it 'should visit the page' do
        subject
        expect(page.current_path).to eq '/user/edit'
      end

      context 'if heap id exists' do
        before { configatron.heap.app_id = 'fake-id' }
        after  { configatron.heap.app_id = nil }

        it 'should have heap' do
          subject
          expect(page.body).to include 'heap.identify'
        end
      end

      context 'when not active' do
        before { user.update! active_until: nil }

        it 'should redirect to plans' do
          subject
          expect(page.current_path).to eq '/plans'
        end
      end
    end

    context 'when not logged in' do
      it 'should be redirected' do
        subject
        expect(page.current_path).to_not eq '/user/edit'
      end
    end
  end
end
