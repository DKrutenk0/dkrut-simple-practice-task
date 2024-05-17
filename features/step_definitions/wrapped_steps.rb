require_relative '../support/config/init_helper.rb'

Given("Generate test member and store data to {string}") do |variable_name|
  member_generator = Generators::MemberGenerator.new
  test_member_data = member_generator.generate_test_member_data
  instance_variable_set("@#{variable_name}", test_member_data)
  $logger.info("Generated user with data: \n\n #{test_member_data}")
end

Given("I am on the Login page") do
  page.current_window.maximize
  visit "https://secure.simplepractice.com"
  Web::Pages::LoginPage.new.wait_for_page_load
  $logger.info("Open login page")
end

When("I use {string} method on {string} using {string} variable") do |method_name, page_name, member|
  member_data = instance_variable_get("@#{member}")
  get_page(page_name).send(method_name.to_sym, member_data)
  $logger.info("Triggered '#{method_name}' method on '#{page_name}' with member data: \n\n #{member_data}")
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
