# スクレイピングを行うエージェント
agent = Mechanize.new

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
    Skiresort.create!(name: name, prefecture: prefecture, area: area, sas_url: sas_url, picture: picture, description: description)
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
      skiresort.parks.build(name: name.inner_text, area: skiresort.area).save
    end
  end
end

# Park.create!(name: '47parks', item: 20, level: '1~10', skiresort_id: 6, area: 3)
# Park.create!(name: 'いいもりパーク', item: 15, level: '2~5', skiresort_id: 7, area: 3)
# Park.create!(name: 'TGpark', item: 15, level: '5~10', skiresort_id: 9, area: 3)
# Park.create!(name: 'メインパーク', item: 10, level: '7~9', skiresort_id: 10, area:3)
# Park.create!(name: '宮パー', item: 6, level: '5~7', skiresort_id: 10, area: 3)
# Park.create!(name: 'チャレンジパーク', item: 10, level: '1~4', skiresort_id: 10, area: 3)
# Park.create!(name: 'The active', item: 40, level: '1~10', skiresort_id: 19, area: 5)

User.create!(name: 'Teruchika Matsubayashi', age: 21, gender: 0, area: 1, image: "https://avatars0.githubusercontent.com/u/31947384?s=400&v=4")
User.create!(name: 'Kento Okui', age: 22, gender: 0, area: 2, image: "https://avatars0.githubusercontent.com/u/31947384?s=400&v=4")
User.create!(name: 'Shogo Uenishi', age: 23, gender: 1, area: 3, image: "https://avatars0.githubusercontent.com/u/31947384?s=400&v=4")
User.create!(name: 'Yuta Okuno', age: 24, gender: 1, area: 4, image: "https://avatars0.githubusercontent.com/u/31947384?s=400&v=4")

# parks_index = [1, 2, 3, 4]
# users_index = [1, 2, 3, 4]
# body = "このパークはとてもhogeでとてもhugaだった。最高にバイブスが上がるキッカーがあった。レールもしっかり整備されていて綺麗なリップだった。とても満足したのでまた訪れたい。"
# parks_index.each do |p_i|
#   users_index.each do |u_i|
#     Comment.create!(park_id: p_i, user_id: u_i, body: body)
#   end
# end
