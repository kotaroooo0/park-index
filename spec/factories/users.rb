FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "名前#{n}さん" }
    age 20
    gender 0
    area_id 1
  end
end
