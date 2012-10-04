Feature: Categories
  In order group my personal transactions
  As a person with an account
  I want to create, edit and delete categories for my transactions

  @javascript
  Scenario: Creating a category
    Given I am a logged user
    And I am on the categories page
    When I press the new category button
    And I create a category with name "Supermarket" and color "#333"
    Then I should be on the categories page
    And I should see my category's name

  # Scenario: Editing an account
  #   Given I have an account named "wallet"
  #   And I am on the accounts page
  #   Then I can edit my account and change its name for "checking"
  #   And I am on the accounts page
  # 
  # @javascript
  # Scenario: Deleting an account
  #   Given I have an account named "wallet"
  #   And I have 3 transactions in my account
  #   And I am on the accounts page
  #   When I click to delete my account
  #   Then I should see "Are you sure to delete the account?"
  #   And I should see the message "Your account and all its transactions will be lost forever"
  #   When I click "Confirm" on the delete confirmation dialog
  #   Then my account and its transactions no longer exists
  #   
  # @javascript
  # Scenario: Desisting to delete an Account
  #   Given I have an account named "wallet"
  #   And I have 3 transactions in my account
  #   And I am on the accounts page
  #   When I click to delete my account
  #   Then I should see "Are you sure to delete the account?"
  #   And I should see the message "Your account and all its transactions will be lost forever"
  #   When I click "Cancel" on the delete confirmation dialog
  #   Then my account and its transactions still exists