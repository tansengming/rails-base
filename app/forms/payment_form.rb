class PaymentForm < Reform::Form
  property :stripeToken
  property :plan

  validates :stripeToken, presence: true
  validates :plan, presence: true
  validates :plan, inclusion: { in: Stripe::Plans.all.select { |plan| plan.metadata[:enable] }.map(&:id).map(&:to_s) }
end
