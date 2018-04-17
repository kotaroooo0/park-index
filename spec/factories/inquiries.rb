# == Schema Information
#
# Table name: inquiries
#
#  id         :integer          not null, primary key
#  name       :string
#  email      :string
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :inquiry do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    content { Faker::Lorem.sentence }
  end
end
