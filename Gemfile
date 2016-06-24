source 'https://rubygems.org'

gem 'rails', '~> 4.2.1'
gem 'pg'
gem "simple_form"
gem 'foreman'
gem 'app'

# Front End
gem 'jquery-rails'
gem 'sass-rails'
gem 'haml'
gem 'twitter-bootstrap-rails'
gem 'less-rails'
gem 'lodash-rails'

# activeadmin
gem 'activeadmin', '~> 1.0.0.pre2'
gem 'devise',      '~> 3.2'

# Services
gem 'dailycred'
gem "intercom-rails"
gem 'newrelic_rpm'
gem 'rollbar'
gem "skylight"

group :development do
  # gem 'heroku' # deprecated and replaced with the Heroku Toolbelt
  gem 'bullet'
  gem 'meta_request'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'spring-commands-rspec'
  gem 'wirble'
  gem 'git-up'
  gem 'powder'
  # gem 'mailcatcher' # Please install outside of bundle
end

group :development, :test do
  gem 'pry-rails'
  gem "awesome_print", :require => "ap"
  gem 'tapp'
  gem 'dotenv-rails'
  gem 'factory_girl_rails'
end

group :test do
  gem 'rspec-rails'
  gem 'capybara'
  gem 'fuubar'
  gem 'database_cleaner'
  gem 'rspec-its'
  gem 'codeclimate-test-reporter', group: :test, require: nil
  gem 'rspec_junit_formatter'
  # gem 'rspec-nc'
  # gem 'guard-rspec'
end

group :assets do
  gem 'coffee-rails'
  gem 'uglifier'
end

group :production do
  gem 'rails_12factor'
  gem 'therubyracer'
  gem 'unicorn'
end
gem 'nokogiri', '>= 1.6.8'
gem 'rest-client', '>= 1.8.0'
