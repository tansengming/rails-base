class NotifierMailer < SendWithUsMailer::Base
  default from: 'no-reply@example.com'

  def welcome(recipient)
    mail_for recipient, 'ID-CODE-FROM-SEND-WITH-US'
  end

  private

  # def default_assigns_for(recipient)
  #   assign :recipient, recipient.name
  # end

  def mail_for(recipient, email_id, opts = {})
    # default_assigns_for recipient
    default_opts = {
      recipient_address: recipient.email,
      email_id: email_id
    }

    mail default_opts.merge(opts)
  end
end
