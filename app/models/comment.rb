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

class Comment < ApplicationRecord
  belongs_to :user, counter_cache: :comment_count
  belongs_to :park, counter_cache: :comment_count
  has_many :likes, dependent: :destroy

  validates :body, presence: true, length: { maximum: 255 }

  # いいねしているユーザーかどうか
  def like_user?(user_id)
    !likes.find_by(user_id: user_id).blank?
  end

end
