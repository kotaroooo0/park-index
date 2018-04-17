class LaneUser < ApplicationRecord
  belongs_to :lane
  belongs_to :user
end
