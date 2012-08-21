Feature: Accounts
  In order to manage my personal finances
  As a person with different money sources
  I want to manage that money sources as different kinds of account
  
  Scenario: Creating and account
    Given I am a logged user
    When I go to the new account page
    And I create an account with name "wallet" and a initial balance of "-3000"
    Then I should be in the accounts page
    And I should see my account name and its current balance of "-3000"

  #@wip
  #Scenario: Account with no transactions
    #Given I am a logged user
    #When I have a wallet account with an initial balance of 10000
    #And the account doesnt have transactions
    #Then the account has a current balance of 10000
    
  #@wip
  #Scenario: Account with transactions
    #Given I am a logged user
    #And I have an account with an initial balance of -300000
    #When I expent 10000 in a pizza
    #And I had an income of 350000
    #Then the account has a current balance of 40000
    
  #Scenario: User total with no accounts
    #Given I am a logged user
    #When I dont have any accounts
    #Then I have 0 in total
    
  #Scenario: User total with two accounts and 3 transactions
    #Given I am a logged user
    #When I have a wallet account with an initial balance of 10000
    #And I have a checking account with an initial balance of -300000
    #And I expent 3000 in a bip card from my wallet account
    #And I expent 10000 in a pizza from my wallet account
    #And I had an income of 350000 that I put on my checking account
    #Then I have 47000 in total
