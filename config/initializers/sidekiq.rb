Sidekiq.configure_server do |config|
  config.redis = { url: configatron.redis_url }
end

Sidekiq.configure_client do |config|
  config.redis = { url: configatron.redis_url }
end