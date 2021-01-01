require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RailsBase
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
    config.active_job.queue_adapter = :sidekiq
    config.active_job.queue_name_prefix = "rails5_#{Rails.env}"

    config.stripe.secret_key      = ENV['STRIPE_SECRET_KEY']
    config.stripe.publishable_key = ENV['STRIPE_PUBLISHABLE_KEY']
    # Settings in config/environments/* take precedence over those specified here.
    # NOTE: please update for PROD
    config.action_mailer.default_url_options = { :host => 'localhost' }

    config.read_encrypted_secrets = true

    config.generators do |g|
      g.test_framework :rspec
      g.template_engine :haml
      g.helper false
      g.assets false
      g.view_specs false
      g.helper_specs false
    end
  end
end
