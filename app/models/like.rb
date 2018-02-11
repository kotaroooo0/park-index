class Like < ApplicationRecord
  belongs_to :comment, counter_cache: :like_count
  belongs_to :user

  validates_uniqueness_of :comment_id, scope: :user_id

end
