source 'https://rubygems.org'

gem 'rails',       '~> 5.0.0'
gem 'app'
gem 'pg'
gem 'nokogiri',    '>= 1.6.8' # security update
gem 'rack-attack'
gem "simple_form"

# Front End
gem 'haml'
gem 'jquery-rails'
gem 'lodash-rails'
gem 'sass-rails'
gem 'twitter-bootstrap-rails'
gem 'jquery-ui-rails', '< 6' # fixes active admin dep issue

# activeadmin
gem 'activeadmin'        , git: 'https://github.com/activeadmin/activeadmin'
gem 'inherited_resources', git: 'https://github.com/activeadmin/inherited_resources'
gem 'devise'

# Services
gem 'analytics-ruby', require: 'segment'
gem 'dailycred'
gem "intercom-rails"
gem 'newrelic_rpm'
gem 'rollbar'
gem 'sendwithus_ruby_action_mailer'
gem "skylight"

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'bullet'
  gem 'foreman'
  gem 'git-up'
  gem 'meta_request'
  gem 'powder'
  gem 'spring-commands-rspec'
  gem 'wirble'
  # gem 'heroku' # deprecated and replaced with the Heroku Toolbelt
  # gem 'mailcatcher' # Please install outside of bundle
end

group :development, :test do
  gem "awesome_print", :require => "ap"
  gem 'dotenv-rails'
  gem 'factory_girl_rails'
  gem 'pry-rails'
  gem 'tapp'
end

group :test do
  gem 'capybara'
  gem 'codeclimate-test-reporter', require: nil
  gem 'database_cleaner'
  gem 'fuubar'
  gem 'poltergeist'
  gem 'phantomjs', :require => 'phantomjs/poltergeist'
  gem 'rspec-its'
  gem 'rspec_junit_formatter'
  gem 'rspec-rails'
  gem 'rspec-retry'
  gem 'simplecov'
  gem 'webmock'
  # rspec guard
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
