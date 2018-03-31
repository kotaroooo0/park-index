Area.create!(id: 0, name: "未設定", description: "未設定")
Area.create!(id: 1, name: "北海道", description: "北海道地方の説明。。。")
Area.create!(id: 2, name: "東北", description: "東北地方の説明。。。")
Area.create!(id: 3, name: "関東甲信越", description: "関東甲信越地方の説明。。。")
Area.create!(id: 4, name: "中京", description: "中京地方の説明。。。")
Area.create!(id: 5, name: "北陸", description: "北陸地方の説明。。。")
Area.create!(id: 6, name: "関西", description: "関西地方の説明。。。")
Area.create!(id: 7, name: "中国/四国/九州", description: "中国四国九州地方の説明。。。")

hakuba47 = Skiresort.create!(name: "Hakuba47 Winter Sports Park", prefecture: "長野県", area_id: 3, sas_url: "https://snow.gnavi.co.jp/guide/htm/r0061s.htm", picture: "http://keijiokamoto.com/system/wp-content/uploads/2016/11/hakuba47park2013-5.jpg", description: "白馬47の説明。。。")
hakuba47.save
hakuba47.parks.build(name: "47parks", area_id: hakuba47.area_id, description: "日本の中では最高のクオリティを誇るパーク", picture: "http://keijiokamoto.com/system/wp-content/uploads/2016/11/hakuba47park2013-5.jpg").save
