# == Schema Information
#
# Table name: skiresorts
#
#  id          :integer          not null, primary key
#  name        :string
#  prefecture  :string
#  area_id     :integer
#  park_count  :integer          default(0)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  sas_url     :string
#  picture     :string
#  description :text
#

FactoryBot.define do
  factory :skiresort do
    sequence(:name) { |n| "スキー場#{n}" }
    prefecture "北海道"
    area_id 1
    sas_url "https://snow.gnavi.co.jp/guide/htm/r0061s.htm"
    picture "profile_pic.jpg"
    description "description"
  end
end
