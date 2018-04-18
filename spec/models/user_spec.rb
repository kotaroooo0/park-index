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

require 'rails_helper'

describe User do

  it "有効なユーザー" do
    valid_user = create(:user)
    expect(valid_user.valid?).to eq true
  end

  it "名がなければ無効な状態であること" do
    invalid_user = build(:user, name: nil)
    expect(invalid_user.valid?).to eq false
  end

  it "名前が30字以下でなければ無効な状態であること" do
    invalid_user = build(:user, name: "A"*31)
    expect(invalid_user.valid?).to eq false
  end

  it "自己紹介が140字以下でなければ無効な状態であること" do
    invalid_user = build(:user, self_introduction: "A"*141)
    expect(invalid_user.valid?).to eq false
  end

  it "ホームゲレンデが20字以下でなければ無効な状態であること" do
    invalid_user = build(:user, home_gelaende: "A"*21)
    expect(invalid_user.valid?).to eq false
  end

  it "Facebookから情報を取得しユーザーを作成する" do
    skip
  end

  describe "インスタンスからプロフィール画を取得する" do

    before do
      image = "xxx.jpg"
      @image_user = create(:user, image: image)
      @not_image_user = create(:user, image: nil)
    end

    context "プロフィール画を登録しているユーザー" do

      it "profile_imageメソッドが自分のプロフィール画を返す" do
        skip
        expect(@image_user.profile_image).to eq @image_user.image
      end

    end

    context "プロフィール画を登録していないユーザー" do

      it "profile_imageメソッドがprofile_pic.jpegを返す" do
        expect(@not_image_user.profile_image).to eq "profile_pic.jpeg"
      end

    end

  end
end
