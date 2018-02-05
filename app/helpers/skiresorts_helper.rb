module SkiresortsHelper

  # ヘッダーからのスキー場検索で用いる
  def searchSkiresorts(query)
    if query
      Skiresort.where(['name LIKE ?', "%#{query}%"])
    else
      Skiresort.all
    end
  end

end
