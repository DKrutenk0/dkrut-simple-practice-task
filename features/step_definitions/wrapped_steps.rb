require_relative '../../features/support/config/init_helper.rb'

Given("I am on the Login page") do
  Web::Pages::LoginPage.new.wait_for_page_load
  $logger.info("Open login page")
end

When("I use {string} method on {string} with member data") do |method_name, page_name|
  get_page(page_name).send(method_name.to_sym, @test_member_data)
  $logger.info("Triggered '#{method_name}' method on '#{page_name}' with member data: \n\n #{@test_member_data}")
end

When("I use {string} method on {string}") do |method_name, page_name|
  get_page(page_name).send(method_name.to_sym)
end

When("I use {string} method on {string} using {string} value") do |method_name, page_name, value|
  get_page(page_name).send(method_name.to_sym, value)
  $logger.info("Triggered '#{method_name}' method on '#{page_name}' with '#{value}' value")
end

def get_page(page_name)
  Object.const_get("Web::Pages::#{page_name.gsub('_', ' ').split.map(&:capitalize).join('')}").new
end
