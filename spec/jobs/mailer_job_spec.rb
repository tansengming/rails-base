require 'rails_helper'

RSpec.describe MailerJob do
  include ActiveJob::TestHelper

  let(:user) { create :user }

  describe '#perform_later' do
    subject { MailerJob.perform_later 'NotifierMailer', 'welcome', user }

    it 'should call the mailer' do
      expect_any_instance_of(NotifierMailer).to receive(:welcome).with(user)
      perform_enqueued_jobs { subject }
    end
  end
end