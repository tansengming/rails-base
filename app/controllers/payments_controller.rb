class PaymentsController < ApplicationController
  before_action :authenticate_user!

  def new
  end

  def create
    current_user.update_attributes! active_until: 3.months.from_now
    redirect_to user_root_path
  end
end