Feature: Accounts
  In order to manage my personal finances
  As a person with different money sources
  I want to manage that money sources as different kinds of account

  Background:
    Given I am a logged user
  
  Scenario: Creating an account
    When I go to the new account page
    And I create an account with name "wallet" and a initial balance of "-3000"
    Then I should be on the accounts page
    And I should see my account's name and its current balance of "-3000"

  Scenario: Editing an account
    Given I have an account named "wallet"
    And I am on the accounts page
    Then I can edit my account and change its name for "checking"
    And I am on the accounts page

  @javascript
  Scenario: Deleting an account
    Given I have an account named "wallet"
    And I have 3 transactions in my account
    And I am on the accounts page
    When I click to delete my account
    Then I should see "Are you sure to delete the account?"
    And I should see the message "Your account and all its transactions will be lost forever"
    When I click "Confirm" on the delete confirmation dialog
    Then my account and its transactions no longer exists
    
  @javascript
  Scenario: Desisting to delete an Account
    Given I have an account named "wallet"
    And I have 3 transactions in my account
    And I am on the accounts page
    When I click to delete my account
    Then I should see "Are you sure to delete the account?"
    And I should see the message "Your account and all its transactions will be lost forever"
    When I click "Cancel" on the delete confirmation dialog
    Then my account and its transactions still exists