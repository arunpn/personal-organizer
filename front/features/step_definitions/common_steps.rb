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

def save_png
  if page.driver.respond_to?(:render)
    file_path = "tmp/capybara/screenshot-#{Time.now}.png"
    page.driver.render(file_path, full: true)
    puts "saved png: #{file_path}"
  else
    puts "#{page.driver.class} do not respond to :render"
  end
end