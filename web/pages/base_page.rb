# frozen_string_literal: true

module Web
  module Pages
    class BasePage < SitePrism::Page
      include Tools::Asserts

      def element_visible?(type, element, timeout = nil)
        timeout = 10 if timeout.nil?
        wait = Selenium::WebDriver::Wait.new(timeout: timeout)
        wait.until { find(type, element).visible? }
      end

      def wait_until(max_wait_time = Capybara.default_max_wait_time)
        Timeout.timeout(max_wait_time) do
          sleep(0.2) until yield
        end
      end
    end
  end
end
