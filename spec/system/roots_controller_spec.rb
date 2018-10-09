require 'rails_helper'
require Rails.root.join('spec/support/feature_spec_helpers')

describe 'roots controller' do
  include FeatureSpecHelpers

  subject { page }
  let!(:user) { create :user, password: '12345678', email: 'email@example.com' }

  describe 'GET /' do
    before { visit '/' }

    context 'when not logged in' do
      its(:status_code) { should eq 200 }
      its(:body) { should include 'Login' }
    end

    context 'when logged in' do
      before { login email: 'email@example.com', password: '12345678' }

      it 'should redirect' do
        visit '/'
        expect(subject.current_path).to eq plans_path
      end
    end
  end
end
