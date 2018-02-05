class Skiresort < ApplicationRecord

  has_many :parks, dependent: :destroy
  belongs_to :area

  scope :have_parks, -> {where.not(park_count: 0)}

  validates :name, presence: true

  validates :prefecture, presence: true

  validates :area, presence: true

  validates :park_count, presence: true

  # スクレイピングにより"Surf and snow"から積雪量とゲレンデ状況を得るインスタンスメソッド
  def getGelaendeCondition
    agent = Mechanize.new
    page = agent.get(self.sas_url)
    elements = page.search('td.bottom em')
    return {"snowfall" => "不明", "range" => "不明"} if elements.blank?
    gelaendeCondition = {"snowfall" => elements[0].inner_text, "range" =>elements[2].inner_text}
    gelaendeCondition
  end

end
