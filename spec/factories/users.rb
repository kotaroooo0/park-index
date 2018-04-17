# == Schema Information
#
# Table name: users
#
#  id                :integer          not null, primary key
#  name              :string
#  age               :integer
#  gender            :integer
#  area_id           :integer
#  image             :string
#  comment_count     :integer          default(0)
#  provider          :string
#  uid               :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  self_introduction :text
#  home_gelaende     :string
#

FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "名前#{n}さん" }
    age 20
    gender 0
    area_id 1
  end
end
