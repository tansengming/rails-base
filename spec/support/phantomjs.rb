require 'capybara/poltergeist'
require 'phantomjs'
Capybara.default_max_wait_time = 4
Capybara.javascript_driver = :poltergeist
# Capybara.register_driver :poltergeist do |app|
#   Capybara::Poltergeist::Driver.new(app, js_errors: false, phantomjs: Phantomjs.path)
# end
