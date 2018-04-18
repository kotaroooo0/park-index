
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
require 'rails_helper'

describe Lane do

  it "有効なレーン" do
    valid_lane = create(:lane)
    expect(valid_lane.valid?).to eq true
  end

  it "名前がなければ無効な状態であること" do
    invalid_lane = build(:lane, name: nil)
    expect(invalid_lane.valid?).to eq false
  end

  it "アイテムがなければ無効な状態であること" do
    invalid_lane = build(:lane, items: nil)
    expect(invalid_lane.valid?).to eq false
  end

end
