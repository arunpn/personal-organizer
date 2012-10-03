Given /^I am on (.*) page$/ do |page|
  visit path_to(page)
end

When /^I go to (.*) page$/ do |page|
  visit path_to(page)
end

Then /^I should see the message "(.*?)"$/ do |text|
  page.should have_content(text)
end

Then /^I should see "(.*)"$/ do |text|
  step %Q{I should see the message "#{text}"}
end

Then /^I should be on (.*) page$/ do |page|
  current_path.should == path_to(page)
end