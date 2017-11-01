# Put all your default configatron settings here.
configatron.redis_url            = ENV['REDIS_URL']
configatron.rollbar.access_token = Rails.application.secrets.rollbar_post_client_item_access_token || ENV['ROLLBAR_ACCESS_TOKEN']
configatron.rollbar.enabled      = true
configatron.auth0.callback_url   = ENV['AUTH0_CALLBACK_URL']
configatron.auth0.client_id      = Rails.application.secrets.auth0_client_id || ENV['AUTH0_CLIENT_ID']
configatron.auth0.client_secret  = Rails.application.secrets.auth0_client_secret || ENV['AUTH0_CLIENT_SECRET']
configatron.auth0.client_domain  = Rails.application.secrets.auth0_client_domain || ENV['AUTH0_DOMAIN']
