class App < Configurable # :nodoc:
  # Settings in config/app/* take precedence over those specified here.
  config.name             = Rails.application.class.parent.name
  config.heap_app_id      = ENV['HEAP_APP_ID']
  config.rollbar_enabled  = true
  config.rollbar_post_client_item_access_token = ENV['ROLLBAR_POST_CLIENT_ITEM_ACCESS_TOKEN']
end