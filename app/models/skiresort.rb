class Skiresort < ApplicationRecord

  has_many :parks, dependent: :destroy

  scope :have_parks, -> {where.not(park_count: 0)}

  enum area: {
    北海道エリア:0, 東北エリア:1, 関東エリア:2, 信越エリア:3, 北陸エリア:4, 東海エリア:5, 関西エリア:6
  }

  validates :name, presence: true

  validates :prefecture, presence: true

  validates :area, presence: true

  validates :park_count, presence: true

  # ヘッダーからスキー場検索で用いる
  def self.search(query)
    if query
      Skiresort.where(['name LIKE ?', "%#{query}%"])
    else
      Skiresort.all
    end
  end

end
