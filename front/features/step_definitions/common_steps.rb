Given /^I am on (.*) page$/ do |page|
  visit path_to(page)
end

When /^I go to (.*) page$/ do |page|
  visit path_to(page)
end

When /^I click "(.*?)" on the delete (.*?) confirmation dialog$/ do |name, dialog|
  sleep 2
  within ".#{dialog}" do
    click_link name
  end
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

def save_png
  if page.driver.respond_to?(:render)
    file_path = "tmp/capybara/screenshot-#{Time.now}.png"
    page.driver.render(file_path, full: true)
    puts "saved png: #{file_path}"
  else
    puts "#{page.driver.class} do not respond to :render"
  end
end