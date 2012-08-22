Given /^I have an account named "(.*?)"$/ do |name|
  @account = create(:account, name: name, user: @user)
end

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

Then /^I can edit my account and change its name for "(.*?)"$/ do |name|
  within ".account" do
    click_link "edit"
  end
  fill_in "account_name", with: name
  click_button "Update Account"
  @account.reload
  @account.name.should == name
end
