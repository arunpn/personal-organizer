@javascript
Feature: Categories
  In order group my personal transactions
  As a person with an account
  I want to create, edit and delete categories for my transactions

  Background:
    Given I am a logged user
    
  Scenario: Creating a category
    And I am on the categories page
    When I press the new category button
    And I create a category with name "Supermarket" and color "#333"
    Then I should be on the categories page
    And I should see my category's name

  Scenario: Editing a category
    Given I have a category named "Supermarket"
    And I am on the categories page
    Then I can edit my category and change its name for "Supermercado"
    And I am on the categories page
  
  Scenario: Deleting a category
    Given I have a category named "Supermarket"
    And I am on the categories page
    When I click to delete my category
    Then I should see the message "Are you sure to delete the category?"
    When I click "Confirm" on the delete category confirmation dialog
    Then my category should no longer exists

  Scenario: Desisting to delete an Account
    Given I have a category named "Supermarket"
    And I am on the categories page
    When I click to delete my category
    Then I should see the message "Are you sure to delete the category?"
    When I click "Cancel" on the delete category confirmation dialog
    Then my category should still exists