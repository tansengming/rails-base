# This file contains descriptions of all your statically defined
# stripe coupons. You may wish to define unique one-off coupons
# elsewhere, but for ones you will use many times, and will be
# shared between users, this is a good place.

# Example
# Stripe::Coupons::Gold25 #=> 'gold25'

Stripe.coupon :gold25 do |coupon|

  # specify if this coupon is useable 'once', 'forever', or 'repeating
  coupon.duration = 'repeating'
end


#
# Once you have your coupons defined, you can run
#
#   rake stripe:prepare
#
# This will export any new coupons to stripe.com so that you can
# begin using them in your API calls. Any coupons found that are not in this
# file will be left as-is.