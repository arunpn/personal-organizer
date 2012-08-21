#When /^I dont have any accounts$/ do
  #@current_user.accounts = []
#end

## Account
#Given /^I have a ([\w\s]*) with an initial balance of (\-?\d+)$/ do |name, initial_balance|
  #@account = @user.new_account(name, initial_balance)
#end

#Given /^I have an account with an initial balance of (\-?\d+)$/ do |initial_balance|
  #@account = create(:account, initial_balance: initial_balance, user: @user)
#end

#When /^the account doesnt have transactions$/ do
  #@account.transactions.should == []
#end

## Expense
#When /^I expent (\-?\d+) in a pizza$/ do |amount|
  #@current_account.add_expense(nil, amount)
#end

#When /^I expent (\-?\d+) in an? (.*) from my (.*)$/ do |amount, expense_name, account_name|
  #@accounts[account_name].add_expense(expense_name, amount)
#end

## Income
#When /^I had an income of (\-?\d+)$/ do |amount|
  #@current_account.add_income(amount)
#end

#When /^I had an income of (\-?\d+) that I put on my ([\w\s]*)$/ do |amount, account_name|
  #@accounts[account_name].add_income(amount)
#end

## Current Balance
#Then /^the account has a current balance of (\-?\d+)$/ do |expected_balance|
  #@account.current_balance.should == expected_balance.to_f
#end

## User total
#Then /^I have (\-?\d+) in total$/ do |amount|
  #@current_user.money.should == amount.to_f
#end
