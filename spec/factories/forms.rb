FactoryGirl.define do
  factory :form do
    association :sub_category, factory: :sub_category
    sequence(:name) { |n| "Form #{n}" }
  end
end
