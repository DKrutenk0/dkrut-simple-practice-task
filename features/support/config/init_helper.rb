# frozen_string_literal: true

require_relative 'hooks.rb'
require_relative '../../../Constants/random'
require 'site_prism'
require 'faker'
require 'rspec'

require_relative '../../../Tools/asserts'

current_path = File.dirname(__FILE__)
pages_path = File.join(current_path + '/../../../Web', 'pages')

Dir[File.join(current_path + '/../../../Tools', '*.rb')].each { |file| require file }
Dir[File.join(pages_path, '*.rb')].each { |file| require file }
