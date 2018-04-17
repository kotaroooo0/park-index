# == Schema Information
#
# Table name: areas
#
#  id          :integer          not null, primary key
#  name        :string
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryBot.define do
  factory :area do
    id 1
    sequence(:name) { |n| "エリア#{n}" }
    description "description"
  end
end
