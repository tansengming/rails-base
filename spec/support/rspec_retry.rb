# Setup rspec-retry for randomly failing tests
# N.B. you can make any non-js spec retry by adding "retry: 3" metadata

# First, set up js tests to auto-retry
RSpec.configure do |config|
  config.around(:each) do |example|
    if example.metadata[:js]
      example.metadata[:retry] = [(ENV["RETRIES"] || 3).to_i, 1].max
    end
    example.run
  end
end

# then set up rspec-retry (needs to be after our setup)
require 'rspec/retry'
RSpec.configure do |config|
  config.verbose_retry = true
end