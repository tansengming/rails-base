source 'https://rubygems.org'

gem 'rails',        '~> 5.1.0'
gem 'configatron'
gem 'nokogiri',     '>= 1.7.2' # security update
gem 'pg'
gem 'puma'
gem 'pundit'
gem 'rack-attack'
gem 'redis-rails'
gem 'reform-rails'
gem 'sidekiq'
gem 'stripe'
gem 'stripe-rails'

# Front End
gem 'haml'
gem 'haml-rails'
gem 'jquery-rails'
gem 'lodash-rails'
gem 'sass-rails'
gem 'turbolinks'
gem 'twitter-bootstrap-rails'

# activeadmin
gem 'activeadmin'
gem 'devise'

# Services
gem 'analytics-ruby', require: 'segment'
gem "intercom-rails"
gem 'newrelic_rpm'
gem 'omniauth-auth0'
gem 'rollbar'
gem 'sendwithus_ruby_action_mailer'
gem 'skylight'

# assets
gem 'uglifier'

group :development do
  gem 'listen'
  gem 'meta_request' # For rails_panel
  gem 'spring-commands-rspec'
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'
  gem 'wirble'
end

group :development, :test do
  gem 'awesome_print', require: 'ap'
  gem "factory_bot_rails"
  gem 'tapp'
end

group :test do
  gem 'capybara'
  gem 'capybara-screenshot'
  gem 'capybara-selenium'
  gem 'chromedriver-helper'
  gem 'codeclimate-test-reporter', require: nil
  gem 'database_cleaner'
  gem 'fuubar'
  gem 'rspec-its'
  gem 'rspec_junit_formatter'
  gem 'rspec-rails'
  gem 'rspec-retry'
  gem 'simplecov'
  gem 'stripe-ruby-mock', require: 'stripe_mock'
  gem 'webmock'
end

group :production do
  gem 'therubyracer'
end
