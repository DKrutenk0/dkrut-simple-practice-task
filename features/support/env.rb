require 'selenium-webdriver'
require 'capybara'
require 'capybara/dsl'
require 'dotenv/load'

Dotenv.load('.env', 'features/support/.env')

Capybara.configure do |config|
  config.run_server = false
  config.default_driver = :selenium_chrome
end
