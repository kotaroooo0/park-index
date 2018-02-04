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

  # スクレイピングにより"Surf and snow"から積雪量とゲレンデ状況を得るインスタンスメソッド
  def getGelaendeCondition
    return "?" if !self.sas_code
    agent = Mechanize.new
    page = agent.get("https://snow.gnavi.co.jp/guide/htm/r#{self.sas_code}s.htm")
    elements = page.search('td em')
    gelaendeCondition = {"snowfall" => elements[0].inner_text, "range" =>elements[2].inner_text}
    gelaendeCondition
  end

end
