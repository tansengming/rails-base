# Put all your default configatron settings here.
RAILS_SECRETS = Rails.application.secrets

configatron.auth0.callback_url     = ENV['AUTH0_CALLBACK_URL']
configatron.auth0.client_id        = RAILS_SECRETS.auth0_client_id || ENV['AUTH0_CLIENT_ID']
configatron.auth0.client_secret    = RAILS_SECRETS.auth0_client_secret || ENV['AUTH0_CLIENT_SECRET']
configatron.auth0.client_domain    = RAILS_SECRETS.auth0_client_domain || ENV['AUTH0_DOMAIN']
configatron.heap.app_id            = RAILS_SECRETS.heap_app_id || ENV['HEAP_APP_ID']
configatron.redis_url              = ENV['REDIS_URL']
configatron.rollbar.access_token   = RAILS_SECRETS.rollbar_post_client_item_access_token || ENV['ROLLBAR_ACCESS_TOKEN']
configatron.rollbar.enabled        = true
