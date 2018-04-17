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

require 'rails_helper'

describe Park do

  it "有効なパーク" do
    valid_park = create(:park)
    expect(valid_park.valid?).to eq true
  end

  it "名がなければ無効な状態であること" do
    invalid_park = build(:park, name: nil)
    expect(invalid_park.valid?).to eq false
  end

  it "エリアがなければ無効な状態であること" do
    invalid_park = build(:park, area_id: nil)
    expect(invalid_park.valid?).to eq false
  end

  it "スキー場がなければ無効な状態であること" do
    invalid_park = build(:park, skiresort_id: nil)
    expect(invalid_park.valid?).to eq false
  end

  it "説明がなければ無効な状態であること" do
    invalid_park = build(:park, description: nil)
    expect(invalid_park.valid?).to eq false
  end

end
