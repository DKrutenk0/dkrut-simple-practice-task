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
    end
  end
end
