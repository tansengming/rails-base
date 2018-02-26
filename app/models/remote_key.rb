class RemoteKey < ApplicationRecord
  scope :stripe_customers, -> { where(remote_service: 'stripe', remote_type: 'customer') }

  def retrieve
    case remote_service
    when 'stripe'
      # e.g. Stripe::Customer.retrieve(key)
      "Stripe::#{remote_type.capitalize}".constantize.retrieve(key)
    else
      raise "#{remote_service} not supported!"
    end
  end
end
