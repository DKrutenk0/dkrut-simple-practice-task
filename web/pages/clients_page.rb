# frozen_string_literal: true

module Web
  module Pages
    class ClientsPage < BasePage
      element :clients_nav_button, :xpath, '//span[@class="link-text"][contains(text(), "Clients")]'
      element :search_input, :xpath, '//input[@class="utility-search"]'
      element :client_name_text_field, :xpath, '//a[@class="ember-view record-name"]'
      element :client_type_text_field, :xpath, '//div[@class="section"]/span'
      element :client_phone_text_field, :xpath, '//div[contains(@class, "phone_item_component")]'
      element :client_email_text_field, :xpath, '//div[contains(@class, "email_item_component")]'
      element :simple_practice_logo, :xpath, '//svg[@class="sp-logo"]'
      element :profile_chart_note_input, :xpath, '//div[@class="ProseMirror ProseMirror-content"]'
      element :review_and_send_button, :xpath, '//button[text()="Review & Send"]'

      def tap_clients
        wait_until_review_and_send_button_invisible
        has_no_xpath?('//button[text()="Review & Send"]')
        clients_nav_button.click
      end

      def put_member_name_in_search(member)
        search_input.set("#{member['first_name']} #{member['last_name']}")
      end

      def retrieve_client_name
        client_name_text_field.text
      end

      def retrieve_client_type
        client_type_text_field.text
      end

      def retrieve_client_phone
        client_phone_text_field.text
      end

      def retrieve_client_email
        client_email_text_field.text
      end

      def tap_logo
        wait_until_profile_chart_note_input_visible
        simple_practice_logo.click
      end

      def verify_client_name(member)
        verify_object_equals("#{member['first_name']} #{member['last_name']}", retrieve_client_name, 'Verify client name')
      end

      def verify_client_type(member)
        verify_object_equals(member['client_type'], retrieve_client_type, 'Verifying client type')
      end

      def verify_client_phone(member)
        expected_phone = "(#{member['phone'][0..2]})" + " #{member['phone'][3..5]}-" + "#{member['phone'][6..10]}"
        actual_phone = retrieve_client_phone.gsub(' Mobile', '')
        verify_object_equals(expected_phone, actual_phone, 'Verifying client phone')
      end

      def verify_client_email(member)
        actual_email = retrieve_client_email.gsub(' Home', '')
        verify_object_equals(member['email'], actual_email, 'Verifying client email')
      end

      def verify_added_client(member)
        verify_client_name(member)
        verify_client_type(member)
        verify_client_phone(member)
        verify_client_email(member)
      end
    end
  end
end
