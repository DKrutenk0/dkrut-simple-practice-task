# frozen_string_literal: true

module Constants
  module Random
    class << self
      def random_first_name
        Faker::Name.first_name
      end

      def random_last_name
        Faker::Name.last_name
      end

      def random_email
        Faker::Internet.email
      end

      def random_phone
        Faker::Number.number(digits: 10).to_s
      end
    end
  end
end
