class User < ApplicationRecord
  devise  :database_authenticatable,
          :lockable,
          # :registerable,
          :recoverable,
          :rememberable,
          :trackable,
          :validatable

  has_many  :remote_keys, as: :remoteable
  has_one   :stripe_customer, -> { stripe_customers.order('id desc') }, class_name: 'RemoteKey', as: :remoteable

  validates :email, uniqueness: true, presence: true
  validates_format_of :email, with: Devise.email_regexp, allow_blank: true

  # https://github.com/plataformatec/devise#activejob-integration
  def send_devise_notification(notification, *args)
    devise_mailer.send(notification, self, *args).deliver_later
  end
end
