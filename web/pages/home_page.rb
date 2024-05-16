# frozen_string_literal: true

module Web
  module Pages
    class HomePage < BasePage
      element :logo_link, :xpath, '//a[@id="ember21"]'
      element :ember_basic_dropdown, :xpath, '//button[contains(@class, "button-navbar create") and @aria-label="create"]'
      elements :ember_dropdown_options, :xpath, "//div[@class='ember-basic-dropdown-content-wormhole-origin']/div/div"
      element :first_name_input, :xpath, '//div[@data-validation-path="firstName"]/input'
      element :last_name_input, :xpath, '//div[@data-validation-path="lastName"]/input'
      element :add_email_button, :xpath, '//div[contains(@class, "emails_section")]/button[@class="button ghost add-row-button"]'
      element :email_input, :xpath, '//div[@data-validation-path="address"]/input'
      element :add_phone_button, :xpath, '//div[contains(@class, "phones_section")]/button[@class="button ghost add-row-button"]'
      element :phone_input, :xpath, '//div[@data-validation-path="number"]/input'
      ### dynamic id's
      element :upcoming_appointments_switch, :xpath, '//div[@id="ember1510"]/input[@id="ember1510-toggle-switch"]', visible: false
      element :incomplete_documents_switch, :xpath, '//div[@id="ember1519"]/input[@id="ember1519-toggle-switch"]', visible: false
      element :cancellations_switch, :xpath, '//div[@id="ember1530"]/input[@id="ember1530-toggle-switch"]', visible: false
      ###
      element :continue_button, :xpath, '//h4/following-sibling::div/button'

      def tap_client_dropdown
        wait_until_logo_link_visible
        ember_basic_dropdown.click
      end

      def tap_create_client(option)
        options_list = ember_dropdown_options.map(&:text)
        option_index = options_list.index { |index| index.include? option }
        ember_dropdown_options[option_index].click
      end

      def put_first_name(member)
        wait_until_first_name_input_visible
        first_name_input.set(member['first_name'])
      end

      def put_last_name(member)
        wait_until_last_name_input_visible
        last_name_input.set(member['last_name'])
      end

      def tap_add_email
        add_email_button.click
      end

      def put_email(member)
        email_input.set(member['email'])
      end

      def tap_add_phone
        add_phone_button.click
      end

      def put_phone(member)
        phone_input.set(member['phone'])
      end
      ### ---------
      def upcoming_appointments_switch
        status = %w[checked unchecked].sample
        set_checkbox_status(upcoming_appointments_toggle, status)
      end

      def incomplete_documents_switch
        status = %w[checked unchecked].sample
        set_checkbox_status(incomplete_documents_switch, status)
      end

      def cancellations_switch
        status = %w[checked unchecked].sample
        set_checkbox_status(cancellations_switch, status)
      end
      ### ---------
      def tap_continue
        continue_button.click
      end
    end
  end
end
