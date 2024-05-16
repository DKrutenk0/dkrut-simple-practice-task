# frozen_string_literal: true

module Tools
  module Log
    class << self
      def instance
        @instance ||= new
      end

      def info(message)
        instance.info(message)
      end
    end

    def info(message)
      File.open("../log.txt", "a") do |file|
        file.puts "[#{Time.now}] INFO: #{message}"
      end
      puts "[#{Time.now}] INFO: #{message}"
    end

    private_class_method :new
  end
end
