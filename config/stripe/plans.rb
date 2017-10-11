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

Stripe.plan :nice_tip do |plan|
  plan.name     = 'Nice Tip'
  plan.amount   = 99
  plan.interval = 'month'
  plan.metadata = { 
    display: true, # determines if it is displayed on the plans page
    enable: true,  # determines if user can subscribe to this plan
    description: 'This will be appreciated'
  }
end

Stripe.plan :good_tip do |plan|
  plan.name     = 'Good Tip'
  plan.amount   = 999
  plan.interval = 'month'
  plan.metadata = { 
    display: true,
    enable: true,
    description: 'This will be REALLY appreciated'
  }
end

Stripe.plan :great_tip do |plan|
  plan.name     = 'Great Tip'
  plan.amount   = 9999
  plan.interval = 'month'
  plan.metadata = { 
    display: false,
    enable: false,
    description: 'This will be GREATLY appreciated'
  }
end

# Once you have your plans defined, you can run
#
#   rake stripe:prepare
#
# This will export any new plans to stripe.com so that you can
# begin using them in your API calls.
