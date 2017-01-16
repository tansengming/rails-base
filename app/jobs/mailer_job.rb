class MailerJob < ApplicationJob
  queue_as :default

  def perform(mailer, method, *options)
    mailer.constantize.send(method, *options).deliver
  end
end

# MailerJob.perform_later 'NotifierMailer', 'welcome', user