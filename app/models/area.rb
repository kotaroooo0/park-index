# == Schema Information
#
# Table name: areas
#
#  id          :integer          not null, primary key
#  name        :string
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Area < ApplicationRecord

  has_many :skiresorts, dependent: :destroy
  has_many :parks, dependent: :destroy
  has_many :users

  validates :name, presence: true
  validates :description, presence: true

  def self.names
    areas = {"未設定" => 0, "北海道" => 1, "東北" => 2, "関東甲信越" => 3, "中京" => 4, "北陸" => 5, "関西" => 6, "中国/四国/九州" => 7}
  end

end
