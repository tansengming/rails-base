class PaymentsController < ApplicationController
  rescue_from Stripe::InvalidRequestError, with: :retry_payment
  before_action :authenticate_user!
  helper_method :selected_plan

  def new
    redirect_to plans_path, flash: {alert: 'Please select a plan before continuing.'} if selected_plan.nil?
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

  def selected_plan
    Stripe::Plans.all.find{|plan| plan.id.to_s == params[:plan]}
  end
end
