Given /^I have my user in the system$/ do
  @user = create(:user)
end

Given /^I am a logged user$/ do
  step "I have my user in the system"
  step "I go to the welcome page"
  step "I login with my email and password"
end

When /^I register an user with my email and password$/ do
  user = build(:user)
  within "#sign_up" do
    fill_in "user_email", with: user.email
    fill_in "user_password", with: user.password
    fill_in "user_password_confirmation", with: user.password
    click_button "Sign up"
  end
end

When /^I login with my email and password$/ do
  within "#login" do
    fill_in "user_email", with: @user.email
    fill_in "user_password", with: @user.password
    click_button "Login"
  end
end

Then /^there is my user in the system$/ do
  User.count.should_not == 0
end
