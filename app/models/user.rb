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

class User < ApplicationRecord

  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  mount_uploader :image, ImageUploader

  validates :name, presence: true, length: { maximum: 30 }
  validates :self_introduction, length: { maximum: 140 }
  validates :home_gelaende, length: { maximum: 20 }
  enum gender: { male: 0, female: 1 }

  def self.create_with_facebook(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
      user.area_id = 0
    end
  end

  def profile_image
    self.image.blank? ? "profile_pic.jpeg" : self.image
  end

end
