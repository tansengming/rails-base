Rollbar.configure do |config|
  config.js_enabled = true
  config.js_options = {
    accessToken: App.rollbar_post_client_item_access_token,
    captureUncaught: true,
    payload: {
      environment: Rails.env
    }
  }
end