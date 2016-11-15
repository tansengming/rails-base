require 'simplecov'
SimpleCov.start

require 'webmock/rspec'
WebMock.disable_net_connect! allow_localhost: true, allow: 'codeclimate.com'