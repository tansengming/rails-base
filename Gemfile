source 'https://rubygems.org'
ruby '2.5.1'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.2.0'

gem 'activeadmin'
gem 'configatron'
gem 'devise'
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
gem 'bootstrap'
gem 'devise-bootstrap-views'
gem 'haml-rails'
gem 'jquery-rails'
gem 'lodash-rails'
gem 'sass-rails'
gem 'turbolinks'
gem 'uglifier'

# Required Services
gem 'newrelic_rpm'
gem 'rollbar'

# Optional Services
gem 'analytics-ruby', require: 'segment'
gem 'intercom-rails'
gem 'sendwithus_ruby_action_mailer'
# gem 'skylight'

group :development do
  gem 'listen'
  gem 'meta_request' # For rails_panel
  gem 'spring-commands-rspec'
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'
end

group :development, :test do
  gem 'awesome_print', require: 'ap'
  gem 'dotenv-rails'
  gem 'factory_bot_rails'
  gem 'tapp'
end

group :test do
  gem 'capybara'
  gem 'capybara-screenshot'
  gem 'capybara-selenium'
  gem 'chromedriver-helper'
  gem 'database_cleaner'
  gem 'fuubar'
  gem 'rspec-its'
  gem 'rspec-rails'
  gem 'rspec-retry'
  gem 'rspec_junit_formatter'
  gem 'simplecov'
  gem 'stripe-ruby-mock', require: 'stripe_mock'
  gem 'webmock'
end

group :production do
  gem 'mini_racer'
end
