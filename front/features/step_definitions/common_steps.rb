PAGES = {
  'welcome' => '/',
  'accounts' => '/accounts'
}

Given /^I am on the (.*) page$/ do |page|
  visit PAGES[page]
end

Then /^I should see the message "(.*?)"$/ do |text|
  page.should have_content(text)
end

Then /^I should be on my (.*) page$/ do |page|
  current_path.should == PAGES[page]
end
