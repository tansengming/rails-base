require 'rails_helper'

describe 'roots controller' do
  subject { page }
  let(:user) { create :user }

  describe 'GET /' do
    context 'when not logged in' do
      it 'should not redirect' do
        visit '/'
        expect(page.status_code).to eq 200
        expect(page.body).to include 'Login' 
      end
    end

    context 'when logged in' do
      before { sign_in user }

      it 'should redirect' do
        visit '/'
        expect(subject.current_path).to eq '/stripetk/plans'
      end
    end
  end
end
