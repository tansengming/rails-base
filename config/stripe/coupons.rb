# This file contains descriptions of all your statically defined
# stripe coupons. You may wish to define unique one-off coupons
# elsewhere, but for ones you will use many times, and will be
# shared between users, this is a good place.

# Example
# Stripe::Coupons::Gold25 #=> 'gold25'

Stripe.coupon :gold25 do |coupon|

  # specify if this coupon is useable 'once', 'forever', or 'repeating
  coupon.duration = 'repeating'

  # how long will this coupon last? (only valid for duration of 'repeating')
  coupon.duration_in_months = 6

  # percentage off
  coupon.percent_off = 25
end

Stripe.coupon :gold50 do |coupon|

  # specify if this coupon is useable 'once', 'forever', or 'repeating
  coupon.duration = 'repeating'

  # how long will this coupon last? (only valid for duration of 'repeating')
  coupon.duration_in_months = 6

  # percentage off
  coupon.percent_off = 25

  coupon.name = 'Gold 50!'
end

#
# Once you have your coupons defined, you can run
#
#   rake stripe:prepare
#
# This will export any new coupons to stripe.com so that you can
# begin using them in your API calls. Any coupons found that are not in this
# file will be left as-is.