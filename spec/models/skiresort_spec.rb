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

require 'rails_helper'

describe Skiresort do

  it "有効なスキー場" do
    valid_skiresort = create(:skiresort)
    expect(valid_skiresort.valid?).to eq true
  end

  it "名がなければ無効な状態であること" do
    invalid_skiresort = build(:skiresort, name: nil)
    expect(invalid_skiresort.valid?).to eq false
  end

  it "都道府県がなければ無効な状態であること" do
    invalid_skiresort = build(:skiresort, prefecture: nil)
    expect(invalid_skiresort.valid?).to eq false
  end

  it "エリアがなければ無効な状態であること" do
    invalid_skiresort = build(:skiresort, area_id: nil)
    expect(invalid_skiresort.valid?).to eq false
  end

  it "URLがなければ無効な状態であること" do
    invalid_skiresort = build(:skiresort, sas_url: nil)
    expect(invalid_skiresort.valid?).to eq false
  end

  it "説明がなければ無効な状態であること" do
    invalid_skiresort = build(:skiresort, description: nil)
    expect(invalid_skiresort.valid?).to eq false
  end

end
