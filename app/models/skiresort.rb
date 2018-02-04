class Skiresort < ApplicationRecord

  has_many :parks, dependent: :destroy

  scope :have_parks, -> {where.not(park_count: 0)}

  enum area: {
    北海道エリア: 1, 東北エリア: 2, 関東甲信越エリア: 3, 中京エリア: 4, 北陸エリア: 5, 関西エリア: 6, 中国四国九州エリア: 7
  }

  validates :name, presence: true

  validates :prefecture, presence: true

  validates :area, presence: true

  validates :park_count, presence: true

  # スクレイピングにより"Surf and snow"から積雪量とゲレンデ状況を得るインスタンスメソッド
  def getGelaendeCondition
    agent = Mechanize.new
    page = agent.get(sas_url)
    elements = page.search('td em')
    gelaendeCondition = {"snowfall" => elements[0].inner_text, "range" =>elements[2].inner_text}
    gelaendeCondition
  end

end
