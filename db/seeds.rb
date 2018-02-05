# スクレイピングを行うエージェント
agent = Mechanize.new

# エリアの情報をスクレイピングして取得
areas = {0 => "未設定", 1 => "北海道", 2 => "東北", 3 => "関東甲信越", 4 => "中京", 5 => "北陸", 6 => "関西", 7 => "中国/四国/九州"}
areas.each { |key, value|
  id = key
  name = value
  page = agent.get("https://snow.gnavi.co.jp/search/list/spl_area01.php?areacdl=#{id}")
  description = page.search('.title p')[1].inner_text
  Area.create!(id: id, name: name, description: description)
}

# スキー場の情報をスクレイピングして取得
areas = (1..7)
areas.each do |area|
  begin
    page = agent.get("https://snow.gnavi.co.jp/search/list/spl_area01.php?areacdl=#{area}")
  rescue Mechanize::ResponseCodeError => e
    next
  end
  names_urls = page.search('.list_result h2 a')
  prefectures = page.search('.list_result h2 small')
  pictures = page.search('.list_result img')
  descriptions = page.search('.list_result div p')
  (0..19).each do |i|
    name = names_urls[i].inner_text
    sas_url = names_urls[i].attribute('href')
    prefecture = prefectures[i].inner_text.tr("[ ", "").tr(" ]","")
    picture = pictures[i].attribute('src')
    description = descriptions[i].inner_text
    Skiresort.create!(name: name, prefecture: prefecture, area_id: area, sas_url: sas_url, picture: picture, description: description)
  end
end

# パークの情報をスクレイピングして取得
Skiresort.all.each do |skiresort|
  begin
    page = agent.get(skiresort.sas_url.gsub(/s.htm/, "gp.htm"))
  rescue Mechanize::ResponseCodeError => e
    next
  end
  names = page.search('span.alphabet')
  if names.present?
    names.each do |name|
      skiresort.parks.build(name: name.inner_text, area_id: skiresort.area_id).save
    end
  end
end

# ユーザー
User.create!(name: 'Teruchika Matsubayashi', age: 21, gender: 0, area_id: 1, image: "card_1.jpg")
User.create!(name: 'Kento Okui', age: 22, gender: 0, area_id: 2, image: "card_2.jpg")
User.create!(name: 'Shogo Uenishi', age: 23, gender: 1, area_id: 3, image: "card_3.jpg")
User.create!(name: 'Yuta Okuno', age: 24, gender: 1, area_id: 4, image: "card_4.jpg")

# コメント
parks_index = [1, 2, 3, 4]
users_index = [1, 2, 3, 4]
body = "このパークはまじでやっばーーーーーーーーーい。最高にバイブスが上がるキッカーがあった。レールもしっかり整備されていて綺麗なリップだった。とても満足したのでまた訪れたい。"
parks_index.each do |p_i|
  users_index.each do |u_i|
    Comment.create!(park_id: p_i, user_id: u_i, body: body)
  end
end
