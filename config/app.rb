class App < Configurable # :nodoc:
  # Settings in config/app/* take precedence over those specified here.
  config.name        = Rails.application.class.parent.name
  config.heap_app_id = ENV['HEAP_APP_ID']
end