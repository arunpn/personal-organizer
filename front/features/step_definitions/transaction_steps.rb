When /^I click the add transactions button$/ do
  click_link "Add Transactions"
end

When /^I create the transactions$/ do |table|
  transactions = table.hashes
  if (diff = transactions.count - 5) > 0
    diff.times { click_link "Add Transaction" }
  end
  transactions.each_with_index do |transaction, index|
    fill_in "transactions_#{index}_name", with: transaction['name']
    fill_in "transactions_#{index}_amount", with: transaction['amount']
    fill_in "transactions_#{index}_description", with: transaction['description']
  end
  click_button "Create Transactions"
end

Then /^I should have (\d+) transactions in my account$/ do |amount|
  @account.transactions.count.should == amount.to_f
end
