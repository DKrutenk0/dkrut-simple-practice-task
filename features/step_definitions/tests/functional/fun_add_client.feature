@web @uicase @functional
Feature: WEB: Tests: UI: Functional: Add client

  Scenario: Verify that a new client is present in the list of clients
    Given Generate test member and store data to 'test_member'
    When I am on the Login page
    And I use 'login' method on 'login_page' using 'test_member' variable
    And I use 'tap_client_dropdown' method on 'home_page'
    And I use 'tap_create_client' method on 'home_page' using 'Create client' value
    And I use 'put_last_name' method on 'home_page' using 'test_member' variable
    And I use 'put_first_name' method on 'home_page' using 'test_member' variable
    And I use 'tap_add_email' method on 'home_page'
    And I use 'put_email' method on 'home_page' using 'test_member' variable
    And I use 'tap_add_phone' method on 'home_page'
    And I use 'put_phone' method on 'home_page' using 'test_member' variable
    And I use 'tap_continue' method on 'home_page'
    And I use 'tap_continue_to_email' method on 'intakes_page'
    And I use 'tap_continue_to_preview' method on 'intakes_page'
    And I use 'tap_share_and_send' method on 'intakes_page'
    And I use 'tap_clients' method on 'clients_page'
    And I use 'put_member_name_in_search' method on 'clients_page' using 'test_member' variable
    Then I use 'verify_added_client' method on 'clients_page' using 'test_member' variable
