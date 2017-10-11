class PlansController < ApplicationController
  before_action :authenticate_user!

  def index
    @plans = Stripe::Plans.all.select{|p| p.metadata[:display]}
  end
end
