Feature: Transactions
  In order to keep tracking of my money transactions
  As a registered user
  I want to add them in bulk, edit, list and delete them
  
  Background:
    Given I am a logged user
    And I have an account with an initial balance of 3000
    And I have created the following categories:
      | name        | color  |
      | supermarket | ff0000 |
      | bank        | 00ff00 |
      | others      | 0000ff |
  
  Scenario: Add daily transactions
    And I am on my account page
    When I click the add transactions button
    And I create the transactions
      | name            | amount | category    | description              |
      | supermercado    | -30000 | supermarket |                          |
      | recarga celular | -2000  | others      | la única recarga del mes |
      | pae             | 53000  | bank        | de agosto                |
    Then I should be on my account page
    And I should have 3 transactions in my account
    And the account current balance is 24000

  @javascript
  Scenario: Add daily transactions (Adding Extra Transactions)
    Given I am on my account page
    When I click the add transactions button
    And I create the transactions
      | name              | amount | category    | description                    |
      | supermercado      | -30000 | supermarket |                                |
      | recarga celular   | -2000  | others      | la única recarga del mes       |
      | pae               | 53000  | bank        | de agosto                      |
      | retorno de dinero | 12000  | supermarket | que le había prestado a camilo |
      | dulces            | 1500   | others      |                                |
      | almuerzo          | 1800   | bank        | puré con chuleta de cerdo      |
    Then I should be on my account page
    And I should have 6 transactions in my account
    And the account current balance is 39300
    And the transactions creation date is today

  @javascript
  Scenario: Add daily transactions for an specified day
    Given I am on my account page
    When I click the add transactions button
    And I set the date for 2 days ago
    And I create the transactions
      | name              | amount | category    | description                    |
      | supermercado      | -30000 | supermarket |                                |
      | recarga celular   | -2000  | others      | la única recarga del mes       |
      | pae               | 53000  | bank        | de agosto                      |
      | retorno de dinero | 12000  | supermarket | que le había prestado a camilo |
      | dulces            | 1500   | others      |                                |
      | almuerzo          | 1800   | bank        | puré con chuleta de cerdo      |
    Then I should be on my account page
    And I should have 6 transactions in my account
    And the account current balance is 39300
    And the transactions creation date is 2 days ago

  Scenario: Add daily transactions with some errors
    Given I am on my account page
    When I click the add transactions button
    And I create the transactions
      | name            | amount | category    | description              |
      | supermercado    |        | supermarket |                          |
      | recarga celular | -2000  | others      | la única recarga del mes |
      |                 | 53000  | bank        | de agosto                |
    Then I should be on the new transactions page
    And I should see the wrong transactions
      | name            | amount | category    | description              |
      | supermercado    |        | supermarket |                          |
      |                 | 53000  | others      | de agosto                |
    And I should have 1 transaction in my account
    And the account current balance is 1000
  
  Scenario: Listing transactions
    Given I have 3 transactions in my account
    When I am on my account page
    Then I can see the list of my 3 account transactions
  
  Scenario: Edit transaction
    Given I have 1 transaction in my account
    And I am on my account page
    When I click the edit transaction button
    And I edit the transaction values:
      | amount | category    | creation   |
      | -3500  | supermarket | 2012-09-24 |
    Then I successfully update the transaction values
    And I am on my account page
  
  @javascript
  Scenario: Delete transaction
    Given I have 1 transaction in my account
    And I am on my account page
    And the account current balance is not 3000
    When I click to delete my transaction and confirm
    Then I should have 0 transactions in my account
    And I should be on my account page
    And the account current balance is 3000