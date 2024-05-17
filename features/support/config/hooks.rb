# frozen_string_literal: true
# features/support/config/hooks.rb

require 'logger'

$logger = Logger.new(STDOUT)


Before('@web') do |scenario|
  $logger.info("Scenario '#{scenario.name}' started")
end

After('@web') do |scenario|
  if scenario.failed?
    $logger.info("Scenario '#{scenario.name}' failed!")
  else
    $logger.info("Scenario '#{scenario.name}' passed")
  end

  Capybara.current_session.reset!
end
