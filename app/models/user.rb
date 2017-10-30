class User < ApplicationRecord
  devise  :omniauthable,
          :omniauth_providers => [:auth0]

  has_one :stripe_customer

  validates :email, uniqueness: true

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
    end
  end
end
