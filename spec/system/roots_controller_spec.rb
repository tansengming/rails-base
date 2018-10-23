require 'rails_helper'
require Rails.root.join('spec/support/feature_spec_helpers')

describe 'roots controller' do
  include FeatureSpecHelpers

  subject { page }
  let!(:user) { create :user, password: '12345678', email: 'email@example.com' }

  describe 'GET /' do
    context 'when not logged in' do
      it 'should not redirect' do
        visit '/'
        expect(page.status_code).to eq 200
        expect(page.body).to include 'Login' 
      end
    end

    context 'when logged in' do
      before { login email: 'email@example.com', password: '12345678' }

      it 'should redirect' do
        visit '/'
        expect(subject.current_path).to eq '/stripetk/plans'
      end
    end
  end
end
