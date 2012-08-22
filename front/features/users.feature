Feature: Users feature
  In order to have my identity on the system
  As an user to want to use the system
  I want to be able to sign up and sign in

  Scenario: Sign Up
    Given I am on the welcome page
    When I register an user with my email and password
    Then there is my user in the system

  Scenario: Sign In
    Given I have my user in the system
    And I am on the welcome page
    When I login with my email and password
    Then I should be on my accounts page
    And I should see the message "no accounts yet"
