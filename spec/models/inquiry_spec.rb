# == Schema Information
#
# Table name: inquiries
#
#  id         :integer          not null, primary key
#  name       :string
#  email      :string
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

describe Inquiry do

  it "有効なお問い合わせ" do
    valid_inquiry = create(:inquiry)
    expect(valid_inquiry.valid?).to eq true
  end

  it "名がなければ無効な状態であること" do
    invalid_inquiry = build(:inquiry, name: nil)
    expect(invalid_inquiry.valid?).to eq false
  end

  it "メールアドレスがなければ無効な状態であること" do
    invalid_inquiry = build(:inquiry, email: nil)
    expect(invalid_inquiry.valid?).to eq false
  end

  it "内容がなければ無効な状態であること" do
    invalid_inquiry = build(:inquiry, content: nil)
    expect(invalid_inquiry.valid?).to eq false
  end

  it "お問い合わせメールを送信する" do
    skip
  end


end
