require 'rails_helper'

RSpec.describe 'roots controller', type: :system do
  let(:user) { create :user }

  describe 'GET /' do
    context 'when not logged in' do
      it 'should not redirect' do
        visit '/'
        expect(page.body).to have_text 'Login'
      end
    end

    context 'when logged in' do
      before { sign_in user }

      it 'should redirect' do
        visit '/'
        expect(page).to have_current_path('/stripe/subscribe/plans')
      end
    end
  end
end
