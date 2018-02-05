class Park < ApplicationRecord

  has_many :comments, dependent: :destroy
  belongs_to :skiresort,counter_cache: :park_count
  belongs_to :area

  validates :name, presence: true

  validates :area, presence: true

  # validates :item, presence: true
  #
  # validates :level, presence: true

  validates :skiresort_id, presence: true

  validates :comment_count, presence: true

end
