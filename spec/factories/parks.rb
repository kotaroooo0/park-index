# == Schema Information
#
# Table name: parks
#
#  id            :integer          not null, primary key
#  name          :string
#  comment_count :integer          default(0)
#  area_id       :integer
#  skiresort_id  :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  picture       :string
#  description   :text
#

FactoryBot.define do
  factory :park do
    sequence(:name) { |n| "パーク#{n}" }
    area_id 1
    skiresort_id 1
    description "description"
  end
end
