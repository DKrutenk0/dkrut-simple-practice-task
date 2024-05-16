# frozen_string_literal: true

require 'logger'

$logger = Logger.new(STDOUT)

Before do
  @constants = Constants::Random
end

Before do |scenario|
  $logger.info("Scenario '#{scenario.name}' started")
end

Before('@web') do
  @driver = Capybara.current_session.driver.browser
  @driver.manage.window.maximize
  @driver.navigate.to "https://secure.simplepractice.com"

  @test_member_data = { 'username' => 'somab63683@lewenbo.com',
                        'password' => 'GoodLuck777',
                        'client_type' => 'Adult',
                        'first_name' => @constants.random_first_name,
                        'last_name' => @constants.random_last_name,
                        'email' => @constants.random_email,
                        'phone' => @constants.random_phone }
end

After do |scenario|
  if scenario.failed?
    $logger.info("Scenario '#{scenario.name}' failed!")
  else
    $logger.info("Scenario '#{scenario.name}' passed")
  end
end

After('@web') do
  Capybara.current_session.reset!
end
