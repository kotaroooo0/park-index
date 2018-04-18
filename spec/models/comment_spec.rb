# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  park_id    :integer
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  like_count :integer          default(0)
#

require 'rails_helper'

describe Comment do

  it "有効なコメント" do
    valid_comment = create(:comment)
    expect(valid_comment.valid?).to eq true
  end

  it "内容がなければ無効な状態であること" do
    invalid_comment = build(:comment, body: nil)
    expect(invalid_comment.valid?).to eq false
  end

  it "内容が255文字以上ならば無効な状態であること" do
    invalid_comment = build(:comment, body: "a"*256)
    expect(invalid_comment.valid?).to eq false
  end

  describe "コメントに対していいねしているユーザーか判定する" do

    before do
      @like_user = create(:user, id: 1)
      @not_like_user = create(:user, id: 2)
      @comment = create(:comment, id: 1, user_id: 1)
      create(:like, user_id: 1, comment_id: 1)
    end

    context "いいねしているユーザーの場合" do
      it "like_user?メソッドがtrueを返す" do
        expect(@comment.like_user?(@like_user)).to eq true
      end
    end

    context "いいねしていないユーザーの場合" do
      it "like_user?メソッドがfalseを返す" do
        expect(@comment.like_user?(@not_like_user)).to eq false
      end
    end
  end
end
