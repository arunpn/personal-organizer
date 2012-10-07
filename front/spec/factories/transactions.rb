FactoryGirl.define do
  factory :transaction do
    name "myTransaction"
    amount -5000
    description "asdf"
    association :account
    association :category
    creation Date.today
  end
  
  factory :transaction_param, class: :transaction do
    sequence(:name) {|n| "myTransaction#{n}" }
    amount -5000
    description "asdf"
    category_id 3
  end
end