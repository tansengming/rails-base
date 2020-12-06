Stripe.price :no_recurring do |price|
  # Use an existing product id to prevent a new product from
  # getting created
  price.product_id = Stripe::Products::PRIMO.id
  price.unit_amount = 999 # $9.99
end

Stripe.price :bronze do |price|
  # Use an existing product id to prevent a new product from
  # getting created
  price.product_id = Stripe::Products::PRIMO.id
  price.billing_scheme = 'tiered'
  # price.unit_amount = 999 # $9.99
  price.recurring = {
    interval: 'month',
    usage_type: 'metered'
  }
  # Use graduated pricing tiers
  # ref: https://stripe.com/docs/api/prices/object#price_object-tiers
  price.tiers = [
    {
      unit_amount: 1500,
      up_to: 10
    },
    {
      unit_amount: 1000,
      up_to: 'inf'
    }
  ]
  price.tiers_mode = 'graduated'
end

# Stripe.price :lite do |price|
#   # Prices may belong to a product, this will create a product along with the price
#   price.name = 'Acme as a service LITE'

#   # You can also specify an existing product ID
#   # price.product_id = Stripe::Products::PRIMO.id

#   # amount in cents. This is 6.99
#   price.unit_amount = 699

#   # currency to use for the price (default 'usd')
#   price.currency = 'usd'

#   price.recurring = {
#     # interval must be either 'day', 'week', 'month' or 'year'
#     interval: 'month',
#     # only bill once every three months (default 1)
#     interval_count: 3,
#     # Must be either 'metered' or 'licensed'
#     usage_type: 'metered',
#     # Specifies a usage aggregation strategy for metered usage
#     aggregate_usage: 'sum'
#   }

# end