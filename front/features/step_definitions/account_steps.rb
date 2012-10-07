Given /^I have an account named "(.*?)"$/ do |name|
  @account = create(:account, name: name, user: @user)
end

Given /^I have an account with an initial balance of (\d+)$/ do |initial_balance|
  @account = create(:account, initial_balance: initial_balance, user: @user)
end

When /^I create an account with name "(.*?)" and a initial balance of "(.*?)"$/ do |name, initial_balance|
  fill_in "account_name", with: name
  fill_in "account_initial_balance", with: initial_balance
  click_button "Create Account"
end

When /^I click to delete my account$/ do
  within ".account" do
    click_link "delete"
  end
end

Then /^my account and its transactions no longer exists$/ do
  Account.count.should == 0
  Transaction.count.should == 0
end

Then /^my account and its transactions still exists$/ do
  Account.count.should_not == 0
  Transaction.count.should_not == 0
end

Then /^I should see my account's name and its current balance of "(.*?)"$/ do |current_balance|
  account = Account.last
  formatted_balance = number_to_currency(current_balance)
  step %Q{I should see "#{account.name}"}
  step %Q{I should see "#{formatted_balance}"}
  account.current_balance.should == current_balance.to_f
end

Then /^I can edit my account and change its name for "(.*?)"$/ do |name|
  within ".account" do
    click_link "edit"
  end
  fill_in "account_name", with: name
  click_button "Update Account"
  @account.reload
  @account.name.should == name
end

Then /^the account current balance is (not )?(-?\d+)$/ do |negation, current_balance|
  @account.reload
  if negation.nil?
    @account.current_balance.should == current_balance.to_f
  else
    @account.current_balance.should_not == current_balance.to_f
  end
end