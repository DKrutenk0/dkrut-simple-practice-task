# frozen_string_literal: true
# features/support/config/init_helper.rb

require_relative 'hooks.rb'
require 'site_prism'
require 'faker'
require 'rspec'
require 'capybara/cucumber'
require 'capybara/dsl'

require_relative '../../../Tools/asserts'

current_path = File.dirname(__FILE__)
constants_path = current_path + '/../../../Constants'
tools_path = current_path + '/../../../Tools'
pages_path = File.join(current_path + '/../../../Web', 'pages')
generators_path = current_path + '/../../../Generators'

Dir[File.join(constants_path, '*.rb')].each { |file| require file }
Dir[File.join(tools_path, '*.rb')].each { |file| require file }
Dir[File.join(pages_path, '*.rb')].each { |file| require file }
Dir[File.join(generators_path, '*.rb')].each { |file| require file }
