Given /^I have (\d+) transactions? in my account$/ do |transactions_number|
  transactions_number.to_i.times { create(:transaction, account: @account) }
end

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

When /^I click to delete my transaction and confirm$/ do
  within ".transaction" do
    click_link "delete"
    sleep 1
    click_link "Confirm"
  end
end

Then /^I should have (\d+) transactions? in my account$/ do |amount|
  @account.transactions.count.should == amount.to_f
end

Then /^I should see the wrong transactions$/ do |table|
  transactions = table.hashes
  transactions.each do |transaction|
    transaction.values do |value|
      page.body.should_match(/#{value}/) unless value.empty?
    end
  end
end

Then /^I can see the list of my (\d+) account transactions$/ do |transactions_number|
  @account.transactions.each do |transaction|
    step %Q{I should see "#{transaction.name}"}
    step %Q{I should see "#{number_to_currency(transaction.amount)}"}
  end
  step %Q{I should have #{transactions_number} transactions in my account}
end