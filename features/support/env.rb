require 'selenium-webdriver'
require 'capybara'
require 'capybara/dsl'

Capybara.configure do |config|
  config.run_server = false
  config.default_driver = :selenium_chrome
end
