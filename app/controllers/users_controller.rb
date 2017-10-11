class UsersController < ApplicationController
  include PaymentRequirable
  before_action :authenticate_user!
  before_action :redirect_to_plans, if: :payment_required?

  def edit
  end
end