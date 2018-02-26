class User < ApplicationRecord
  devise  :omniauthable,
          :omniauth_providers => [:auth0]

  has_many  :remote_keys, as: :remoteable
  has_one   :stripe_customer, -> { stripe_customers.order('id desc') }, class_name: 'RemoteKey', as: :remoteable

  validates :email, uniqueness: true, presence: true

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
    end
  end
end
