require 'simplecov'
SimpleCov.start do
  add_filter '/spec/'
end

require 'webmock/rspec'
WebMock.disable_net_connect! allow_localhost: true, allow: 'codeclimate.com'

require 'irb'