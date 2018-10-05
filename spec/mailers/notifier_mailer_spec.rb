require 'rails_helper'

describe NotifierMailer do
  let(:user) { create :user }

  describe '#welcome' do
    subject    { described_class.welcome(user).deliver }
    before     { stub }
    let(:stub) do
      stub_request(:post, 'https://api.sendwithus.com/api/v1/send')
        .with(body: "{\"email_id\":\"ID-CODE-FROM-SEND-WITH-US\",\"recipient\":{\"address\":\"#{user.email}\"},\"esp_account\":\"\",\"version_name\":\"\",\"locale\":\"\"}")
        .to_return(status: 200, body: '', headers: {})
    end

    it 'should not crash' do
      expect { subject }.not_to raise_error
    end
  end
end
