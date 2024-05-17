# frozen_string_literal: true

module Generators
  class MemberGenerator
    def generate_test_member_data
      constants = Constants::Random
      {
        'username' => ENV['TEST_USERNAME'],
        'password' => ENV['TEST_PASSWORD'],
        'client_type' => 'Adult',
        'first_name' => constants.random_first_name,
        'last_name' => constants.random_last_name,
        'email' => constants.random_email,
        'phone' => constants.random_phone
      }
    end
  end
end
