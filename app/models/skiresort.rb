class Skiresort < ApplicationRecord

  validates :name, presence: true

  validates :prefecture, presence: true

  validates :area, presence: true

end
