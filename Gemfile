source 'https://rubygems.org'

gem 'rails',    '~> 5.1.0'
gem 'configatron'
gem 'nokogiri', '>= 1.7.2' # security update
gem 'pg'
gem 'rack-attack'
gem 'redis-rails'
gem 'sidekiq'
gem 'stripe'
gem 'stripe-rails'

# Front End
gem 'haml'
gem 'jquery-rails'
gem 'lodash-rails'
gem 'sass-rails'
gem 'twitter-bootstrap-rails'

# activeadmin
gem 'activeadmin'
gem 'devise'

# Services
gem 'analytics-ruby', require: 'segment'
gem "intercom-rails"
gem 'newrelic_rpm'
gem 'rollbar'
gem 'sendwithus_ruby_action_mailer'
gem 'skylight'

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
  gem 'dotenv-rails'
  gem 'factory_girl_rails'
  gem 'puma'
  gem 'tapp'
end

group :test do
  gem 'capybara'
  gem 'codeclimate-test-reporter', require: nil
  gem 'database_cleaner'
  gem 'fuubar'
  gem 'poltergeist'
  gem 'phantomjs', require: 'phantomjs/poltergeist'
  gem 'rspec-its'
  gem 'rspec_junit_formatter'
  gem 'rspec-rails'
  gem 'rspec-retry'
  gem 'simplecov'
  gem 'webmock'
end

group :assets do
  gem 'coffee-rails'
  gem 'uglifier'
end

group :production do
  gem 'rails_12factor'
  gem 'therubyracer'
end
