# frozen_string_literal: true

module Web
  module Pages
    class LoginPage < BasePage
      element :login_button, :xpath, '//input[@class="button primary" and @type="submit"]'
      element :username_input, :id, 'user_login'
      element :password_input, :id, 'user_password'
      element :header_logo, :xpath, '//header'

      def wait_for_page_load
        header_logo.visible?
      end

      def put_username(username)
        username_input.set(username)
      end

      def put_password(password)
        password_input.set(password)
      end

      def login(member)
        put_username(member['username'])
        put_password(member['password'])
        login_button.click
      end
    end
  end
end
