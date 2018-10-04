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
end
