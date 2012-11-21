FactoryGirl.define do
  factory :account do
    name "myAccount"
    initial_balance 0
    association :user
  end
end
