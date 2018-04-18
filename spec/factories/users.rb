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
    name { Faker::Name.name}
    age { Faker::Number.between(15, 45) }
    gender "male"
    area_id 1
  end
end
