When /^I create an account with name "(.*?)" and a initial balance of "(.*?)"$/ do |name, initial_balance|
  fill_in "account_name", with: name
  fill_in "account_initial_balance", with: initial_balance
  click_button "Create Account"
end

Then /^I should see my account's name and its current balance of "(.*?)"$/ do |current_balance|
  account = Account.last
  step %Q{I should see "#{account.name}"}
  step %Q{I should see "#{account.current_balance}"}
  account.current_balance.should == current_balance.to_f
end
