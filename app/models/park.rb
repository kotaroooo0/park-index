class Park < ApplicationRecord

  has_many :comments, dependent: :destroy
  has_many :lanes, dependent: :destroy
  belongs_to :skiresort,counter_cache: :park_count
  belongs_to :area

  validates :name, presence: true

  validates :area_id, presence: true

  validates :skiresort_id, presence: true

end
