class PlansController < ApplicationController
  before_action :authenticate_user!

  def index
    @plans = Stripe::Plans.all.select { |plan| plan.metadata[:display] }
  end
end
