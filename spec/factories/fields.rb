FactoryGirl.define do
  factory :field do
    association :form, factory: :form
    sequence(:name) { |n| "Field #{n}" }
    sequence(:order) { |n| n }
    field_type 0
  end
end
