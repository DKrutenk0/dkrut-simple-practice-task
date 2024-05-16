# frozen_string_literal: true

module Web
  module Pages
    class IntakesPage < BasePage
      element :continue_button, :xpath, '//div[contains(@class, "full-flyout-footer")]/div//button[@class="button primary"]'
      element :select_plan_link, :xpath, '//button[@class="button-link" and contains(text(), "plan")]'
      element :view_message_link, :xpath, "//a[@href='#']"
      element :banner_warning_text_field, :xpath, '//div[contains(@class, "banner-warning")]'
      element :sending_email_notification_text_field, :xpath, '//*[contains(text(), "Sending email now")]'

      def tap_continue
        element_visible?(:xpath, '//div[contains(@class, "banner-warning")]', 15)
        continue_button.click
      end

      alias tap_submit tap_continue

      def tap_continue_to_preview
        wait_until_select_plan_link_visible
        continue_button.click
      end

      def tap_share_and_send
        tap_submit
        wait_until_sending_email_notification_text_field_invisible
      end
    end
  end
end
