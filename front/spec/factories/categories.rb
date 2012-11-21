FactoryGirl.define do
  factory :category do
    sequence(:name) {|n| "myCategory#{n}" } 
    color "#333"
    association :user
  end
end