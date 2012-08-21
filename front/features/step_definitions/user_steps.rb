Given /^I have my user in the system$/ do
  @user = create(:user)
end

When /^I create an user with my email and password$/ do
  @user = create(:user)
end

When /^I log in with my email and password$/ do
  fill_in "email", with: @user.email
  fill_in "password", with: @user.password
  click_button "submit"
end

When /^I go to the signup page$/ do
  visit '/users/sign_up'
end

When /^I go to the login page$/ do
  visit '/users/sign_in'
end

Then /^I am on my main page$/ do
  current_path.should == '/main'
end

Then /^there is my user in the system$/ do
  User.where(email: @user.email, password: @user.password).first.should_not be_nil
end
