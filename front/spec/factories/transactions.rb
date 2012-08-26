FactoryGirl.define do
  factory :transaction do
    name "myTransaction"
    amount -5000
    description "asdf"
    association :account
  end
end