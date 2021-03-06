# == Schema Information
#
# Table name: likes
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  comment_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Like < ApplicationRecord
  belongs_to :comment, counter_cache: :like_count
  belongs_to :user

  validates :user_id, presence: true
  validates :comment_id, presence: true
  validates_uniqueness_of :comment_id, scope: :user_id

end
