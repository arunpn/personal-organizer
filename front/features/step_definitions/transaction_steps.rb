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
    select transaction['category'], from: "transactions_#{index}_category_id", with: transaction['description']
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

When /^I click the edit transaction button$/ do
  within ".transaction" do
    click_link "edit"
  end
end

When /^I set the date for (.*) days ago$/ do |days_number|
  fill_in "creation_date", with: (Date.today -  days_number.to_i.days).to_s
end

When /^I edit the transaction values:$/ do |table|
  table.hashes.each do |hash|
    @new_transaction_values = hash
    hash.each_pair do |key, value|
      if key == "category"
        select value, from: "transaction_#{key}_id"
      else
        fill_in "transaction_#{key}", with: value
      end
    end
  end
end

Then /^I successfully update the transaction values$/ do
  click_button "Update Transaction"
  transaction = Transaction.last
  @new_transaction_values.each_pair do |key, value|
    if key == "category"
      transaction.send(key).name.should == value
    else
      transaction.send(key).to_s.should == value
    end
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

Then /^the transactions creation date is (.*)$/ do |time|
  expected_date = Date.today - time.to_i.days
  Transaction.all.each do |transaction|
    transaction.creation.should == expected_date
  end
end