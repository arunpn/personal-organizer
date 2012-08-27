FactoryGirl.define do
  factory :transaction do
    name "myTransaction"
    amount -5000
    description "asdf"
    association :account
  end
  
  factory :transaction_param, class: :transaction do
    sequence(:name) {|n| "myTransaction#{n}" }
    amount -5000
    description "asdf"
  end
end