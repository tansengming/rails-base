class StripeCustomer < ApplicationRecord
  belongs_to :user

  def retrieve
    Stripe::Customer.retrieve(stripe_customer_id)
  end
end
