class Comment < ApplicationRecord
  belongs_to :user, counter_cache: :comment_count
  belongs_to :park, counter_cache: :comment_count
  has_many :likes, dependent: :destroy

  validates :body, presence: true, length: { maximum: 255 }

  # いいねしているユーザーかどうか
  def like_user?(user_id)
    !likes.find_by(user_id: user_id).nil?
  end

end
