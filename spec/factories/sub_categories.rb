FactoryGirl.define do
  factory :sub_category do
    association :category, factory: :category
    sequence(:name) { |n| "Sub Cat #{n}" }
    sequence(:slug) { |n| "sub-cat-#{n}" }
  end
end
