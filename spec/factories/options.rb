FactoryGirl.define do
  factory :option do
    association :field, factory: :field
    sequence(:name) { |n| "Option #{n}" }
  end
end
