# Put all your default configatron settings here.
configatron.heap_app_id                           = ENV['HEAP_APP_ID']
configatron.stripe.publishable_key                = ENV['STRIPE_PUBLISHABLE_KEY']
configatron.stripe.secret_key                     = ENV['STRIPE_SECRET_KEY']
configatron.redis_url                             = ENV['REDIS_URL']
configatron.rollbar_enabled                       = true
configatron.rollbar_post_client_item_access_token = ENV['ROLLBAR_POST_CLIENT_ITEM_ACCESS_TOKEN']
