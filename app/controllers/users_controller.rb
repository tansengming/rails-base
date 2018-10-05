class UsersController < ApplicationController
  before_action :authenticate_user!
  rescue_from Pundit::NotAuthorizedError do
    redirect_to plans_path, notice: 'Please subscribe to continue.'
  end

  def edit
    authorize User
  end
end
