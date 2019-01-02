require 'rails_helper'

RSpec.describe NotifierMailer do
  let(:user) { create :user }

  describe '#welcome' do
    subject(:deliver_mail) { described_class.welcome(user).deliver }

    before { stub }

    let(:stub) do
      stub_request(:post, 'https://api.sendwithus.com/api/v1/send')
        .with(body: "{\"email_id\":\"ID-CODE-FROM-SEND-WITH-US\",\"recipient\":{\"address\":\"#{user.email}\"},\"esp_account\":\"\",\"version_name\":\"\",\"locale\":\"\"}")
        .to_return(status: 200, body: '', headers: {})
    end

    it 'should not crash' do
      deliver_mail
      expect(stub).to have_been_requested
    end
  end
end
