Given /^I have an account named "(.*?)"$/ do |name|
  @account = create(:account, name: name, user: @user)
end

Given /^I have an account with an initial balance of (\d+)$/ do |initial_balance|
  @account = create(:account, initial_balance: initial_balance, user: @user)
end

Given /^I am on my account page$/ do
  visit account_path(@account)
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

When /^I click "(.*?)" on the delete confirmation dialog$/ do |name|
  sleep 2
  within ".delete_confirmation" do
    click_link name
  end
end

Then /^my account and its transactions no longer exists$/ do
  Account.count.should == 0
  #TODO: pending include transactions
end

Then /^my account and its transactions still exists$/ do
  Account.count.should_not == 0
  #TODO: pending include transactions
end

Then /^I should see my account's name and its current balance of "(.*?)"$/ do |current_balance|
  account = Account.last
  step %Q{I should see "#{account.name}"}
  step %Q{I should see "#{account.current_balance}"}
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

Then /^the account current balance is (-?\d+)$/ do |current_balance|
  @account.current_balance.should == current_balance.to_f
end

Then /^I should be on the page of my account$/ do
  current_path.should == account_path(@account)
end