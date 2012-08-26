Feature: Transactions
  In order to keep tracking of my money transactions
  As a registered user
  I want to add them in bulk, edit, list and delete them

  @wip
  @javascript
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
      | retorno de dinero | 12000  | que le había prestado a camilo |
      | dulces            | 1500   |                                |
      | almuerzo          | 1800   | puré con chuleta de cerdo      |
    Then I should be on the page of my account
    And I should have 6 transactions in my account
    And the account current balance is 39300
