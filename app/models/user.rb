class User < ApplicationRecord

  has_many :comments, dependent: :destroy

  validates :name, presence: true, length: { maximum: 30 }

  validates :self_introduction, length: { maximum: 140 }

  enum gender: { male: 0, female: 1 }

  enum area: {
    北海道:1,東北:2,関東:3,中部:4,東海:5,関西:6,
    中国:7,四国:8,九州:9,沖縄:10
  }

  def self.create_with_facebook(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
      user.image = auth["info"]["image"]
    end
  end

end
