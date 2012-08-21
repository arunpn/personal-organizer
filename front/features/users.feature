Feature: Users feature
  In order to have my identity on the system
  As an user to want to use the system
  I want to be able to sign up and sign in

  Scenario: Sign Up
    When I go to the signup page
    And I create an user with my email and password
    Then there is my user in the system

  Scenario: Sign In
    Given I have my user in the system
    When I go to the login page
    And I log in with my email and password
    Then I am on my main page
