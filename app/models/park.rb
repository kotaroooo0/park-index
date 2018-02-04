class Park < ApplicationRecord

  has_many :comments, dependent: :destroy
  belongs_to :skiresort,counter_cache: :park_count

  enum area: {
    北海道エリア: 1, 東北エリア: 2, 関東甲信越エリア: 3, 中京エリア: 4, 北陸エリア: 5, 関西エリア: 6, 中国四国九州エリア: 7
  }

  validates :name, presence: true

  validates :area, presence: true

  validates :item, presence: true

  validates :level, presence: true

  validates :skiresort_id, presence: true

  validates :comment_count, presence: true

end
