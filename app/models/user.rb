class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise  :database_authenticatable,
          :omniauthable,
          :omniauth_providers => [:auth0]

  has_one :stripe_customer


  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create! do |user|
      user.email    = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end
end
