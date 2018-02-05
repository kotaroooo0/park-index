class User < ApplicationRecord

  has_many :comments, dependent: :destroy

  validates :name, presence: true, length: { maximum: 30 }

  validates :self_introduction, length: { maximum: 140 }

  enum gender: { male: 0, female: 1 }

  enum area: {
    北海道エリア: 1, 東北エリア: 2, 関東甲信越エリア: 3, 中京エリア: 4, 北陸エリア: 5, 関西エリア: 6, 中国四国九州エリア: 7
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
