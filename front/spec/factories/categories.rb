FactoryGirl.define do
  factory :category do
    name "myCategory"
    color "#333"
    association :user
  end
end