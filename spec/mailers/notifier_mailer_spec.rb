require 'spec_helper'

describe NotifierMailer do
  let(:user) { create :user }

  describe '#welcome' do
    subject    { described_class.welcome(user.id).deliver }
    before     { stub }
    let(:stub) {
      stub_request(:post, "https://api.sendwithus.com/api/v1/send").
               with(:body => "{\"email_id\":\"ID-CODE-FROM-SEND-WITH-US\",\"recipient\":{\"address\":\"#{user.email}\"},\"email_data\":{\"recipient\":null},\"esp_account\":\"\",\"version_name\":\"\",\"locale\":\"en-US\"}").
               to_return(:status => 200, :body => "", :headers => {})
    }

    it 'should not crash' do
      expect { subject }.not_to raise_error
    end
  end
end