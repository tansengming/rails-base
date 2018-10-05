require "selenium/webdriver"

Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end

Capybara.register_driver :headless_chrome do |app|
  headless_options = %w(headless window-size=1200,1100 disable-gpu)
  headful_options  = %w(window-size=1200,1100)

  capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
    chromeOptions: { args: headless_options }
  )

  Capybara::Selenium::Driver.new  app,
                                  browser: :chrome,
                                  desired_capabilities: capabilities
end

Capybara.javascript_driver = :headless_chrome

Capybara::Screenshot.register_driver(:headless_chrome) do |driver, path|
  driver.browser.save_screenshot(path)
end
