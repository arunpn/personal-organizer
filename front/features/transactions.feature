Feature: Transactions
  In order to keep tracking of my money transactions
  As a registered user
  I want to add them in bulk, edit, list and delete them

  Scenario: Add daily transactions
    Given I am a logged user
    And I have an account with an initial balance of 3000
    And I am on my account page
    When I click the add transactions button
    And I create the transactions
      | name              | amount | description                    |
      | supermercado      | -30000 |                                |
      | recarga celular   | -2000  | la única recarga del mes       |
      | pae               | 53000  | de agosto                      |
    Then I should be on my account page
    And I should have 3 transactions in my account
    And the account current balance is 24000

  @javascript
  Scenario: Add daily transactions (Adding Extra Transactions)
    Given I am a logged user
    And I have an account with an initial balance of 3000
    And I am on my account page
    When I click the add transactions button
    And I create the transactions
      | name              | amount | description                    |
      | supermercado      | -30000 |                                |
      | recarga celular   | -2000  | la única recarga del mes       |
      | pae               | 53000  | de agosto                      |
      | retorno de dinero | 12000  | que le había prestado a camilo |
      | dulces            | 1500   |                                |
      | almuerzo          | 1800   | puré con chuleta de cerdo      |
    Then I should be on my account page
    And I should have 6 transactions in my account
    And the account current balance is 39300

  Scenario: Add daily transactions for an specified day
    pending

  Scenario: Add daily transactions with some errors
    Given I am a logged user
    And I have an account with an initial balance of 3000
    And I am on my account page
    When I click the add transactions button
    And I create the transactions
      | name            | amount | description              |
      | supermercado    |        |                          |
      | recarga celular | -2000  | la única recarga del mes |
      |                 | 53000  | de agosto                |
    Then I should be on the new transactions page
    And I should see the wrong transactions
      | name            | amount | description              |
      | supermercado    |        |                          |
      |                 | 53000  | de agosto                |
    And I should have 1 transaction in my account
    And the account current balance is 1000

    
  Scenario: Listing transactions
    pending
    
  Scenario: Edit transaction
    pending
    
  Scenario: Delete transaction
    pending