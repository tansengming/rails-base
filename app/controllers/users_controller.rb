class UsersController < ApplicationController
  before_action :authenticate_user!
  rescue_from Pundit::NotAuthorizedError do
    redirect_to stripe_subscribe.plans_path, notice: 'Please subscribe to continue.'
  end

  def edit
    authorize User
  end
end
