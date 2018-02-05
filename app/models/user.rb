class User < ApplicationRecord

  has_many :comments, dependent: :destroy
  belongs_to :area

  validates :name, presence: true, length: { maximum: 30 }

  validates :self_introduction, length: { maximum: 140 }

  enum gender: { male: 0, female: 1 }

  def self.create_with_facebook(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
      user.image = auth["info"]["image"] || "profile_pic.jpg"
      user.area_id = 0
    end
  end

end
