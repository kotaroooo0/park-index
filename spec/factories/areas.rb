FactoryBot.define do
  factory :area do
    id 1
    sequence(:name) { |n| "エリア#{n}" }
    description "description"
  end
end
