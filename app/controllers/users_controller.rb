class UsersController < ApplicationController
  before_action :authenticate_user!

  def edit
    redirect_to(plans_path) unless policy(User).edit?
  end
end