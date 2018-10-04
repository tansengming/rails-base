# Put all your default configatron settings here.
RAILS_SECRETS = Rails.application.secrets

configatron.heap.app_id            = RAILS_SECRETS.heap_app_id || ENV['HEAP_APP_ID']
configatron.redis_url              = ENV['REDIS_URL']
configatron.rollbar.access_token   = RAILS_SECRETS.rollbar_post_client_item_access_token || ENV['ROLLBAR_ACCESS_TOKEN']
configatron.rollbar.enabled        = true
