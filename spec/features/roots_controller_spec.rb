require 'rails_helper'

describe 'roots controller' do
  subject { page }

  describe 'GET /' do
    before { visit '/' }

    context 'when not logged in' do
      its(:status_code) { should eq 200 }
      its(:body) { should include 'Sign Up' }
    end
  end
end