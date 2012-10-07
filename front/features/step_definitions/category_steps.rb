Given /^I have a category named "(.*?)"$/ do |name|
  @category = create(:category, name: name, user: @user)
end

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

When /^I click to delete my category$/ do
  within ".category" do
    click_link "delete"
  end
end

Then /^I should see my category's name$/ do
  name = Category.last.name
  step %Q{I should see "#{name}"}
end

Then /^I can edit my category and change its name for "(.*?)"$/ do |new_name|
  within ".category" do
    click_link "edit"
  end
  sleep 1
  within ".edit_category_form" do
    fill_in "category_name", with: new_name
    click_button "Update Category"
  end
  @category.reload
  @category.name.should == new_name
end

Then /^my category should no longer exists$/ do
  Category.count.should == 0
end

Then /^my category should still exists$/ do
  Category.count.should_not == 0
end