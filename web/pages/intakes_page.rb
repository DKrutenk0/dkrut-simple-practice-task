# frozen_string_literal: true

module Web
  module Pages
    class IntakesPage < BasePage
      element :continue_button, :xpath, '//div[contains(@class, "full-flyout-footer")]/div//button[@class="button primary"]'
      element :select_plan_link, :xpath, '//button[@class="button-link" and contains(text(), "plan")]'
      element :view_message_link, :xpath, "//a[@href='#']"
      element :sending_email_notification_text_field, :xpath, '//*[contains(text(), "Sending email now")]'

      def tap_continue
        wait_until_continue_button_visible
        continue_button.click
      end

      alias tap_submit tap_continue

      def tap_continue_to_email
        wait_until{ element_visible?(:xpath, '//a[@href="/practice_settings/note_templates/library"]', 15) }
        tap_continue
      end

      def tap_continue_to_preview
        wait_until_select_plan_link_visible
        tap_continue
      end

      def tap_share_and_send
        tap_submit
        wait_until_sending_email_notification_text_field_invisible
        has_no_xpath?('//*[contains(text(), "Sending email now")]')
      end
    end
  end
end
