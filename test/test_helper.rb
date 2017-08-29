require 'simplecov'
SimpleCov.start do
  add_filter '/spec/'
end

ENV["RAILS_ENV"] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

require 'webmock/rspec'
WebMock.disable_net_connect! allow_localhost: true, allow: 'codeclimate.com'

require 'irb'
