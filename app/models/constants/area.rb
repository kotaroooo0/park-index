module Constants
  class Area < ActiveHash::Base

    field :name

    add id: 0, name: "未設定"
    add id: 1, name: "北海道"
    add id: 2, name: "東北"
    add id: 3, name: "関東甲信越"
    add id: 4, name: "中京"
    add id: 5, name: "北陸"
    add id: 6, name: "関西"
    add id: 7, name: "中国/四国/九州"

  end
end
