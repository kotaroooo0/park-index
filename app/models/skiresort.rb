# == Schema Information
#
# Table name: skiresorts
#
#  id          :integer          not null, primary key
#  name        :string
#  prefecture  :string
#  area_id     :integer
#  park_count  :integer          default(0)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  sas_url     :string
#  picture     :string
#  description :text
#

class Skiresort < ApplicationRecord

  has_many :parks, dependent: :destroy

  scope :have_parks, -> {where.not(park_count: 0)}

  validates :name, presence: true
  validates :prefecture, presence: true
  validates :area_id, presence: true
  validates :sas_url, presence: true
  validates :description, presence: true

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
