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
    areas = {0 => "北海道", 1 => "東北", 2 => "関東", 3 => "信越", 4 => "北陸", 5 => "東海", 6 => "関西"}
    areas[area_param.to_i]
  end

end
