class RemoteKey < ApplicationRecord
  scope :stripe_customers, -> { where(remote_service: 'stripe', remote_type: 'customer') }

  def retrieve
    Stripe::Customer.retrieve(key)
  end
end
