Given /^I have my user in the system$/ do
  @user = create(:user)
end

Given /^I am on the welcome page$/ do
  visit '/'
end

When /^I create an user with my email and password$/ do
  user = build(:user)
  fill_in "user_email", with: user.email
  fill_in "user_password", with: user.password
  fill_in "user_password_confirmation", with: user.password
  click_button "Sign up"
end

When /^I log in with my email and password$/ do
  fill_in "user_email", with: @user.email
  fill_in "user_password", with: @user.password
  click_button "Sign in"
end

When /^I go to the signup page$/ do
  visit '/users/sign_up'
end

When /^I go to the login page$/ do
  visit '/users/sign_in'
end

Then /^I am on my main page$/ do
  current_path.should == '/main/index'
end

Then /^there is my user in the system$/ do
  User.count.should == 1
end
