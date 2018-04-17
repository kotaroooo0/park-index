# == Schema Information
#
# Table name: lanes
#
#  id         :integer          not null, primary key
#  name       :string
#  items      :text
#  park_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

FactoryBot.define do
  factory :lane do
    association :park
    association :user
    name { Faker::Lorem.sentence}
    items { Faker::Lorem.sentence }
    user_id 1
    park_id 1
  end
end
