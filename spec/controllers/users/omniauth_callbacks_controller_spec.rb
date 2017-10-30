require 'rails_helper'

RSpec.describe Users::OmniauthCallbacksController do
  describe 'when the new user saves correctly' do
    before do
      @omniauth = {
        'uid' => "12345",
        'provider' => "auth0",
        'info' => OpenStruct.new({email: 'test@example.com'})
      }
      request.env["omniauth.auth"] = OpenStruct.new(@omniauth)
    end

    subject { get :auth0 }

    it 'should be a redirect' do
      expect(subject).to redirect_to user_root_path
    end
  end


  describe 'when the new user does not save' do
    let!(:user) { create :user, email: 'test@example.com'}
    before do
      @omniauth = {
        'uid' => "12345",
        'provider' => "auth0",
        'info' => OpenStruct.new({email: 'test@example.com'})
      }
      request.env["omniauth.auth"] = OpenStruct.new(@omniauth)
    end

    subject { get :auth0 }

    it 'should be a redirect' do
      expect(subject).to redirect_to root_path
    end
  end

  describe 'when there is an auth failure' do
    subject { described_class.action(:failure).call(request.env) }

    it 'should be a redirect' do
      expect(subject.first).to eq 302
    end
  end
end
