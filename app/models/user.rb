class User < ApplicationRecord

  has_many :comments, dependent: :destroy

  validates :name, presence: true, length: { maximum: 30 }

  validates :self_introduction, length: { maximum: 140 }

  enum gender: { male: 0, female: 1 }

  enum area: {
    北海道:0,東北:1,関東:2,中部:3,東海:4,関西:5,
    中国:6,四国:7,九州:8,沖縄:9
  }

  def self.create_with_facebook(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
      user.image = auth["info"]["image"] || "profile_pic.jpg"
    end
  end

end
