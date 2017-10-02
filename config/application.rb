require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RailsBase
  class Application < Rails::Application
    config.middleware.use Rack::Attack

    config.cache_store = :redis_store, configatron.redis_url

    config.active_job.queue_adapter = :sidekiq
    config.active_job.queue_name_prefix = "rails5_#{Rails.env}"

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
