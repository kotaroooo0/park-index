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
    snowfall = "不明"
    range = "不明"
    snowfall = elements[0].inner_text if elements[0].present?
    range = elements[2].inner_text if elements[2].present?
    return {"snowfall" => snowfall + "cm", "range" => range}
  end

end
