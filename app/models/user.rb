class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise  :database_authenticatable,
          :lockable,
          :registerable,
          :recoverable,
          :rememberable,
          :trackable,
          :validatable

  has_one :stripe_customer
end