class Comment < ApplicationRecord
  belongs_to :user, counter_cache: :comment_count
  belongs_to :park, counter_cache: :comment_count

  validates :body, presence: true, length: { maximum: 255 }

end
