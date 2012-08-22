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

  @wip
  Scenario: Deleting an account
    Given I have an account named "wallet"
    When I click to delete my account
    Then I should see the message "are you really sure to delete your account? all your transactions will be lost forever"
    And I click "Confirm"
    Then my account and its transactions no longer exists
