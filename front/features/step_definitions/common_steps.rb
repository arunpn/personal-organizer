PAGES = {
  'welcome' => '/',
  'accounts' => '/accounts',
  'new account' => '/accounts/new',
}

Given /^I am on the (.*) page$/ do |page|
  visit PAGES[page]
end

When /^I go to the (.*) page$/ do |page|
  visit PAGES[page]
end

Then /^I should see the message "(.*?)"$/ do |text|
  page.should have_content(text)
end

Then /^I should see "(.*)"$/ do |text|
  step %Q{I should see the message "#{text}"}
end

Then /^I should be on (my|the) (.*) page$/ do |arg, page|
  current_path.should == PAGES[page]
end
