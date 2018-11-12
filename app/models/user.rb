class User < ApplicationRecord
  include Stripe::Subscriberable

  devise  :database_authenticatable,
          :lockable,
          # :registerable,
          :recoverable,
          :rememberable,
          :trackable,
          :validatable

  validates :email, uniqueness: true, presence: true
  validates_format_of :email, with: Devise.email_regexp, allow_blank: true

  # https://github.com/plataformatec/devise#activejob-integration
  def send_devise_notification(notification, *args)
    devise_mailer.send(notification, self, *args).deliver_later
  end
end
