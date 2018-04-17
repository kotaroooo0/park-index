# == Schema Information
#
# Table name: likes
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  comment_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

describe Like do

  it "有効ないいね" do
    valid_like = build(:like)
    expect(valid_like.valid?).to eq true
  end

  it "いいねは重複できない" do
    create(:like)
    invalid_like = build(:like)
    invalid_like.valid?
    expect(invalid_like.valid?).to eq false
  end

end
