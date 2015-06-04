FactoryGirl.define do
  factory :category do
    sequence(:name) { |n| "Cat #{n}" }
    sequence(:slug) { |n| "cat-#{n}" }
  end
end
