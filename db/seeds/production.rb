Area.create!(id: 0, name: "未設定", description: "未設定")
Area.create!(id: 1, name: "北海道", description: "北海道地方の説明")
Area.create!(id: 2, name: "東北", description: "東北地方の説明")
Area.create!(id: 3, name: "関東甲信越", description: "首都である東京都と近県6県を含む関東と、山梨県、長野県、新潟県の甲信越地方は、冬季は西高東低という冬型の気圧配置を受けやすいエリア。日本海側は非常に積雪が多く、日本屈指の豪雪エリアとして知られる新潟県はFISアルペンスキー・ワールドカップの開催地になった。山岳が多い長野県はスキー場数が多く、雪質に定評があり、長野冬季五輪の開催地として世界的に知られている。その他のエリアは首都圏から行きやすく、屋内スキー場やウォータージャンプの施設が充実。")
Area.create!(id: 4, name: "中京", description: "中京地方の説明")
Area.create!(id: 5, name: "北陸", description: "北陸地方の説明")
Area.create!(id: 6, name: "関西", description: "関西地方の説明")
Area.create!(id: 7, name: "中国/四国/九州", description: "中国四国九州地方の説明")

hakuba47 = Skiresort.create!(name: "Hakuba47 Winter Sports Park", prefecture: "長野県", area_id: 3, sas_url: "https://snow.gnavi.co.jp/guide/htm/r0061s.htm", picture: "http://keijiokamoto.com/system/wp-content/uploads/2016/11/hakuba47park2013-5.jpg", description: "極上の雪質と降雪量が魅力の白馬。 HAKUBA47＆白馬五竜には上級者から初心者 や子供達が楽しめる多彩なコースが皆様のお越しをお待ちしています。 あなたにとって きっと忘れることのない最高の体験をお約束いたします。")
hakuba47.save
hakuba47.parks.build(name: "47parks", area_id: hakuba47.area_id, description: "Hakuba47の『47PARKS』は20ｍ級のビッグジャンプをはじめ、10以上の様々なサイズのジャンプに、国内でも数の少ないしっかりと整備の行き届いたハーフパイプ、初・中・上級とステップアップしやすいJIBアイテム、森の中を利用した疾走感のあるクロスコースなど、全てのジャンルを網羅した、世界に誇る日本最大規模のスノーパークです。", picture: "http://keijiokamoto.com/system/wp-content/uploads/2016/11/hakuba47park2013-5.jpg").save

tsugaike = Skiresort.create!(name: "栂池高原スキー場", prefecture: "長野県", area_id: 3, sas_url: "https://snow.gnavi.co.jp/guide/htm/r0144s.htm", picture: "https://coresites-cdn.factorymedia.com/whitelines_new/wp-content/uploads/2017/05/hammerbanger2.jpg", description: "北アルプス白馬エリア最大級の広大なフィールドは、緩斜面で幅が広く、初心者や初級者からファミリーまで安心して楽しめ、ちびっこも楽しめるキッズパークも！レクチャーを受けた方のみの「TSUGA POW DBD」と呼ばれる非圧雪エリアも！バックカントリーも楽しめ、ビギナーからエキスパートが楽しめるフィールド満載！" )
tsugaike.save
tsugaike.parks.build(name: "TGparks", area_id: tsugaike.area_id, description: "2018 年より栂池高原スキー場はプロスノーボードチーム HYWOD がプロデュースする スノーパーク. 『THE PARKS』と契約し、『TG PARKS』として日本最大規模のスノー パークを発足する事が決定しました。", picture: "https://coresites-cdn.factorymedia.com/whitelines_new/wp-content/uploads/2017/05/hammerbanger2.jpg")

cortina = Skiresort.create!(name: "白馬コルチナスキー場", prefecture: "長野県", area_id: 3, sas_url: "https://snow.gnavi.co.jp/guide/htm/r0033s.htm", picture: "https://snow.gnavi.co.jp/real_img/r0033/promotion_banner_image_1_r0033.jpg", description: "１：フワフワの天然雪と初級者～上級者まで楽しめる多彩なコース天然雪100%の極上のパウダースノーは、海外からもプレーヤーが来るほどの人気。雪質が柔らかく、サラサラしているので転んでも体が濡れにくいのが特長です。全16コースで、幅が200mある初級者用のゲレンデから標高1,400mの絶景を楽しむ上級者コースまであるのも魅力。" )
cortina.save

happoone = Skiresort.create!(name: "白馬八方尾根スキー場", prefecture: "長野県", area_id: 3, sas_url: "https://snow.gnavi.co.jp/guide/htm/r0142s.htm", picture: "http://www.famiski.jp/wordpress/wp-content/uploads/2017/11/8576052223c9328fc00f1bacab9f2d17.jpg", description: "滑り派パパママの憧れ、国際山岳リゾートは、小さなキッズの雪遊びから上達者までをサポートするさすがの〝ゲレンデ力〟と〝ファミスキ偏差値〟の高さ！感動の絶景を味わいながら、ビッグスケール・ファミスキ！")
happoone.save
