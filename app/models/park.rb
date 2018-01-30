class Park < ApplicationRecord

  belongs_to :skiresort,counter_cache: :park_count

  validates :name, presence: true

  validates :item, presence: true

  validates :level, presence: true

  validates :skiresort_id, presence: true

end
