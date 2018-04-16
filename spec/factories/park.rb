FactoryBot.define do
  factory :park do
    sequence(:name) { |n| "パーク#{n}" }
    area_id 1
    skiresort_id 1
  end
end
