# frozen_string_literal: true

module Tools
  module Asserts
    include RSpec::Matchers

    def verify_object_equals(expected, actual, attribute)
      $logger.info("Comparing objects: #{expected} equaling actual: #{actual}")
      expect(expected).to eql(actual), "#{attribute} should be equal to #{expected} but was #{actual}"
    end
  end
end
