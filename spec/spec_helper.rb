require "codeclimate-test-reporter"
CodeClimate::TestReporter.start

require 'webmock/rspec'
WebMock.disable_net_connect! allow_localhost: true