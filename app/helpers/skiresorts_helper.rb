module SkiresortsHelper

  # ヘッダーからのスキー場検索で用いる
  def searchSkiresorts(query)
    if query
      Skiresort.where(['name LIKE ?', "%#{query}%"])
    else
      Skiresort.all
    end
  end

  # エリアを得るメソッド
  def getArea(area_param)
    areas = {1 => "北海道", 2 => "東北", 3 => "関東甲信越", 4 => "中京", 5 => "北陸", 6 => "関西", 7 => "中国/四国/九州"}
    areas[area_param.to_i]
  end

end
