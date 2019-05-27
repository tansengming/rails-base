source 'https://rubygems.org'
ruby '2.6.2'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.2.0'

gem 'activeadmin'
gem 'bootsnap', require: false
gem 'configatron'
gem 'devise'
gem 'pg'
gem 'puma'
gem 'pundit'
gem 'rack-attack'
gem 'redis-rails'
gem 'sidekiq'
gem 'stripe-rails'
gem 'stripe-subscribe', github: 'tansengming/stripe-subscribe'

# Front End
gem 'bootstrap'
gem 'coffee-rails'
gem 'devise-bootstrap-views'
gem 'haml-rails'
gem 'jquery-rails'
gem 'lodash-rails'
gem 'turbolinks'
gem 'uglifier'

# Required Services
gem 'newrelic_rpm'
gem 'rollbar'
gem 'scout_apm'

# Optional Services
gem 'analytics-ruby', require: 'segment'
gem 'intercom-rails'
gem 'sendwithus_ruby_action_mailer'
# gem 'skylight'

group :development do
  gem 'listen'
  gem 'meta_request' # For rails_panel
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
  gem 'capybara-selenium'
  gem 'faker'
  gem 'fuubar'
  gem 'rspec-its'
  gem 'rspec-rails'
  gem 'rspec-retry'
  gem 'rspec_junit_formatter'
  gem 'simplecov'
  gem 'stripe-ruby-mock', require: 'stripe_mock'
  gem 'webdrivers'
  gem 'webmock'
end

group :production do
  gem 'mini_racer'
end
