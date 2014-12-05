source 'https://rubygems.org'

gem 'rails', '~> 4.1.4'
gem 'pg'
gem "simple_form"
gem 'foreman'
gem 'app'
gem 'iconv' # fixes json_pure-1.2.4/lib/json/common.rb:2:in `require': cannot load such file -- iconv (LoadError)

# Production
gem 'therubyracer'
gem 'unicorn'

# Front End
gem 'jquery-rails'
gem 'sass-rails'
gem 'haml'
gem 'twitter-bootstrap-rails'
gem 'less-rails'
gem 'lodash-rails'

# activeadmin
gem 'activeadmin', github: 'gregbell/active_admin'
gem 'polyamorous', github: 'activerecord-hackery/polyamorous'
gem 'ransack',     github: 'activerecord-hackery/ransack'
gem 'formtastic',  github: 'justinfrench/formtastic'
gem 'devise'

# Services
gem 'newrelic_rpm'
gem 'dailycred'
gem 'rollbar'

group :development do
  gem 'mailcatcher'
  gem 'heroku'
  gem 'bullet'
  gem 'meta_request'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'spring-commands-rspec'
  gem 'wirble'
  gem 'pry-rails'
  gem 'git-up'
  gem 'powder'
end

group :development, :test do
  gem "awesome_print", :require => "ap"
  gem 'tapp'
  gem 'dotenv-rails'
  gem 'factory_girl_rails'
end

group :test do
  gem 'rspec-rails'
  gem 'capybara'
  gem 'fuubar', github: 'thekompanee/fuubar'
  gem 'database_cleaner'
  gem 'rspec-its'
  gem 'codeclimate-test-reporter', group: :test, require: nil
  gem 'rspec-nc'
  gem 'guard-rspec'
end

group :assets do
  gem 'coffee-rails'
  gem 'uglifier'
end

group :production do
  gem 'rails_12factor'
end