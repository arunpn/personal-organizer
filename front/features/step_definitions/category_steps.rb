When /^I press the new category button$/ do
  click_link "new_category"
end

When /^I create a category with name "(.*?)" and color "(.*?)"$/ do |name, color|
  sleep 1
  within "#new_category_form" do
    fill_in "category_name", with: name
    fill_in "category_color", with: color
    click_button "Create Category"
  end
end

Then /^I should see my category's name$/ do
  name = Category.last.name
  step %Q{I should see "#{name}"}
end