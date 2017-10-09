class PaymentsController < ApplicationController
  rescue_from Stripe::InvalidRequestError, with: :retry_payment
  before_action :authenticate_user!

  def new
  end

  def create
    stripe_token = params[:stripeToken]

    if stripe_token.nil?
      flash[:error] = 'There was a problem with the payment, please try again'
      redirect_to new_payment_path and return
    end

    Payments::UserActivator.(stripe_token, current_user)
    flash[:notice] = 'Thank you for the payment!'
    redirect_to user_root_path
  end

  private
  def retry_payment
    flash[:error] = 'There was a problem with the payment, please try again'
    redirect_to new_payment_path and return
  end
end