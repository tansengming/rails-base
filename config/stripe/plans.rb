# This file contains descriptions of all your stripe plans

# Example
# Stripe::Plans::PRIMO #=> 'primo'

# Stripe.plan :primo do |plan|
#
#   # plan name as it will appear on credit card statements
#   plan.name = 'Acme as a service PRIMO'
#
#   # amount in cents. This is 6.99
#   plan.amount = 699
#
#   # currency to use for the plan (default 'usd')
#   plan.currency = 'usd'
#
#   # interval must be either 'day', 'week', 'month' or 'year'
#   plan.interval = 'month'
#
#   # only bill once every three months (default 1)
#   plan.interval_count = 3
#
#   # number of days before charging customer's card (default 0)
#   plan.trial_period_days = 30
# end

Stripe.plan :tiered do |plan|
  plan.name = 'Tiered'
  plan.aggregate_usage = 'max'
  plan.billing_scheme = 'tiered'
  # interval must be either 'day', 'week', 'month' or 'year'
  plan.interval = 'month'
  plan.interval_count = 1
  plan.tiers = [
    {
      unit_amount: 1500,
      up_to: 10
    },
    {
      unit_amount: 1000,
      up_to: 'inf'
    }
  ]
  plan.tiers_mode = 'graduated'
  plan.usage_type = 'metered'
end

Stripe.plan :nice_tip do |plan|
  plan.name     = 'Nice Tip'
  plan.amount   = 99
  plan.interval = 'month'
end

Stripe.plan :good_tip do |plan|
  plan.name     = 'Good Tip'
  plan.amount   = 999
  plan.interval = 'month'
end

Stripe.plan :great_tip do |plan|
  plan.name     = 'Great Tip'
  plan.amount   = 9999
  plan.interval = 'month'
end

# Once you have your plans defined, you can run
#
#   rake stripe:prepare
#
# This will export any new plans to stripe.com so that you can
# begin using them in your API calls.
