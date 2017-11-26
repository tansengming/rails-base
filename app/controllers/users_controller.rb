class UsersController < ApplicationController
  before_action :authenticate_user!
  rescue_from Pundit::NotAuthorizedError do
    redirect_to plans_path, alert: 'Please subscribe to see this page.'
  end

  def edit
    authorize User
  end
end