Feature: Accounts
  In order to manage my personal finances
  As a person with different money sources
  I want to manage that money sources as different kinds of account
  
  Scenario: Creating and account
    Given I am a logged user
    When I go to the new account page
    And I create an account with name "wallet" and a initial balance of "-3000"
    Then I should be on the accounts page
    And I should see my account's name and its current balance of "-3000"
