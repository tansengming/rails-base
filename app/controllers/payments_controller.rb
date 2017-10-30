class PaymentsController < ApplicationController
  rescue_from Stripe::InvalidRequestError, with: :retry_payment
  before_action :authenticate_user!

  def new
  end

  def create
    payment_params = params.slice(:stripeToken, :plan)
    @form = PaymentForm.new(OpenStruct.new)

    if @form.validate(payment_params)
      Payments::Create.(payment_params[:stripeToken], payment_params[:plan], current_user)

      flash.notice = 'Thank you for the payment!'
      redirect_to user_root_path
    else
      retry_payment
    end
  end

  private
  def retry_payment
    flash.alert = 'There was a problem with the payment, please try again'
    redirect_to new_payment_path and return
  end
end
