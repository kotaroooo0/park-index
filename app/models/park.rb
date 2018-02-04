class Park < ApplicationRecord

  has_many :comments, dependent: :destroy
  belongs_to :skiresort,counter_cache: :park_count

  enum area: {
    北海道エリア:0, 東北エリア:1, 関東エリア:2, 信越エリア:3, 北陸エリア:4, 東海エリア:5, 関西エリア:6
  }

  validates :name, presence: true

  validates :area, presence: true

  validates :item, presence: true

  validates :level, presence: true

  validates :skiresort_id, presence: true

  validates :comment_count, presence: true

end
