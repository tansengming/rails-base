require 'rails_helper'
require Rails.root.join('spec/support/feature_spec_helpers')

describe 'roots controller' do
  include FeatureSpecHelpers

  subject { page }

  describe 'GET /' do
    before { visit '/' }

    context 'when not logged in' do
      its(:status_code) { should eq 200 }
      its(:body) { should include 'Sign Up' }
    end

    context 'when logged in' do
      before { fill_and_submit_sign_up_form }

      it 'should redirect' do
        visit '/'
        expect(subject.current_path).to eq plans_path
      end
    end
  end
end