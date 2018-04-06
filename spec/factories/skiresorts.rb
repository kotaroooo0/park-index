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
