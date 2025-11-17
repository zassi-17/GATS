# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

zassi = Member.find_or_create_by!(email: "saigusa@example.com") do |member|
  member.name = "ザッシ"
  member.password = "#{ENV['SECRET_KEY']}"
  member.password_confirmation = "#{ENV['SECRET_KEY']}" 
  member.introduction = "3~4歳の頃からゲームをやっています。アクションゲームや推理ゲームが好きですが最近はRPGにハマっています！これからガンガン、レビュー投稿していきます！" 
  member.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user1.jpg"), filename:"sample-user1.jpg")
  member.favorite_game = "火星侵攻軍6"
  member.is_active = true
  member.created_at = Time.new(2025, 7, 1, 17, 16)
  member.current_sign_in_at = Time.new(2025, 11, 1, 11, 30)
end

razer = Member.find_or_create_by!(email: "razer@example.com") do |member|
  member.name = "レーザー"
  member.password = "#{ENV['SECRET_KEY']}"
  member.password_confirmation = "#{ENV['SECRET_KEY']}" 
  member.introduction = "ホラーゲーム大好き" 
  member.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user2.png"), filename:"sample-user2.png")
  member.favorite_game = "壱~one~"
  member.is_active = true
  member.created_at = Time.new(2025, 9, 1, 19, 56)
  member.current_sign_in_at = Time.new(2025, 11, 5, 18, 10)
end

test = Member.find_or_create_by!(email: "test@example.com") do |member|
  member.name = "テストマン"
  member.password = "#{ENV['SECRET_KEY']}"
  member.password_confirmation = "#{ENV['SECRET_KEY']}" 
  member.introduction = "スピード感と反射神経が試されるステージが大好き。オンライン対戦で腕試しするのも趣味です。ゲームの話で盛り上がれる人歓迎" 
  member.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user3.png"), filename:"sample-user3.png")
  member.favorite_game = "最初の現実10"
  member.is_active = true
  member.created_at = Time.new(2025, 11, 4, 22, 32)
  member.current_sign_in_at = Time.new(2025, 11, 17, 7, 54)
end

bee = Member.find_or_create_by!(email: "bee@example.com") do |member|
  member.name = "Hachinosu"
  member.password = "#{ENV['SECRET_KEY']}"
  member.password_confirmation = "#{ENV['SECRET_KEY']}" 
  member.introduction = "トロフィーコンプリートや全アイテム収集を達成することがゲームをプレイする原動力になっています！" 
  member.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user4.png"), filename:"sample-user4.png")
  member.favorite_game = "戦え！！BEEST～あの山の頂へ～"
  member.is_active = true
  member.created_at = Time.new(2025, 10, 7, 20, 12)
  member.current_sign_in_at = Time.new(2025, 11, 15, 7, 54)
end




genre_action = Genre.find_or_create_by(name: "アクションゲーム")

genre_adventure = Genre.find_or_create_by(name: "アドベンチャーゲーム")

genre_mystery = Genre.find_or_create_by(name: "推理ゲーム")

genre_simulation = Genre.find_or_create_by(name: "シミュレーションゲーム")

genre_horror = Genre.find_or_create_by(name: "ホラーゲーム")

genre_rhythm = Genre.find_or_create_by(name: "リズムゲーム")

genre_race = Genre.find_or_create_by(name: "レースゲーム")

genre_rpg = Genre.find_or_create_by!(name: "ロールプレイングゲーム")



review_winter = Review.find_or_create_by!(title: "みんなの冬休み2") do |review|
  review.member = zassi
  review.body = "単刀直入に感想を述べると懐かしい感覚になるゲームでした。このシリーズ定番の釣った魚で戦わせる魚相撲は各魚のパワーバランスの調整がよく、
  戦略性が問われると思います。続編期待してます！"
  review.genre = genre_adventure
  review.rating = 4
  review.is_active = true
  review.created_at = Time.new(2025, 7, 21, 15, 00)
end

Review.find_or_create_by!(title: "ザ・スピードレース") do |review|
  review.member = razer
  review.body = "オンライン対戦での白熱したバトルが最高だった。また、コースや天候によって最適なセッティングを考える過程は、
  リアルレーシングゲームらしい奥深さを感じさせる。総合的に爽快感と緊張感で楽しいゲームです。"
  review.genre = genre_race
  review.rating = 3
  review.is_active = true
  review.created_at = Time.new(2025, 9, 30, 5, 20)
end

review_fantasy = Review.find_or_create_by!(title: "最初の現実10") do |review|
  review.member = test
  review.body = "王道ファンタジーの要素をしっかりと踏襲しつつ、新しい戦闘スタイルで飽きの来ないバトルが楽しめる。ストーリーは感動要素多めでした。
  クリア後に出現するダンジョンは今までプレイしたゲームの中で一番、難易度の高いダンジョンでした。"
  review.genre = genre_rpg
  review.rating = 3.5
  review.is_active = true
  review.created_at = Time.new(2025, 11, 16, 18, 00)
end

Review.find_or_create_by!(title: "火星侵攻軍6", member: zassi) do |review|
  review.body = "過去一番でやりこんだゲームといっても過言ではない。なぜなら前作から敵の種類も格段に増え、
  CPUの攻撃手段が多様化したことで力押しでは勝てず戦略を考えることが楽しくなった。終盤の雰囲気的には続編が出ないかもしれないが続編待ってます。"
  review.genre = genre_action
  review.rating = 4.5
  review.is_active = true
  review.created_at = Time.new(2025, 8, 16, 8, 00)
end

Review.find_or_create_by!(title: "火星侵攻軍6", member: test) do |review|
  review.body = "このシリーズは今まで触れてこなかったが評判が良かったのでプレイしてみました。オンラインでの協力プレイが楽しすぎて、
  今までプレイしてなかったことを後悔しました。"
  review.genre = genre_action
  review.rating = 5
  review.is_active = true
  review.created_at = Time.new(2025, 11, 10, 9, 00)
end

Review.find_or_create_by!(title: "墓場から何か声がしない？") do |review|
  review.member = razer
  review.body = "夜にプレイして寝れなくなりました。"
  review.genre = genre_horror
  review.rating = 1
  review.is_active = true
  review.created_at = Time.new(2025, 10, 16, 1, 00)
end

review_dance =Review.find_or_create_by!(title: "リズムに乗ってダンス・イン・ヘブン") do |review|
  review.member = bee
  review.body = "頭に残るＢＧＭが名曲でした。"
  review.genre = genre_rhythm
  review.rating = 2.5
  review.is_active = true
  review.created_at = Time.new(2025, 10, 11, 16, 00)
end

Review.find_or_create_by!(title: "大南極大陸の事件Ｒ") do |review|
  review.member = bee
  review.body = "このシリーズあるあるだけど５章の事件から伏線が回収されていき、ワクワクする展開が最高です。"
  review.genre = genre_mystery
  review.rating = 5
  review.is_active = true
  review.created_at = Time.new(2025, 11, 12, 1, 00)
end

review_hyper =Review.find_or_create_by!(title: "ハイパーマイク・サンセット") do |review|
  review.member = zassi
  review.body = "近所の同級生に借りて夜中までプレイしてました。シンプルながら奥の深いゲームだと思います。"
  review.genre = genre_action
  review.rating = 4.5
  review.is_active = true
  review.created_at = Time.new(2025, 9, 16, 12, 00)
end

Review.find_or_create_by!(title: "家具を作ろう　level2") do |review|
  review.member = test
  review.body = "地味なゲームだけど奥が深い。"
  review.genre = genre_simulation
  review.rating = 2
  review.is_active = true
  review.created_at = Time.new(2025, 10, 16, 21, 00)
end

Review.find_or_create_by!(title: "パイナップルハンター・リターンズ") do |review|
  review.member = test
  review.body = "発売まで長いこと待たされただけあって、瑞々しい。"
  review.genre = genre_action
  review.rating = 4.5
  review.is_active = true
  review.created_at = Time.new(2025, 11, 16, 22, 50)
end



ReviewComment.find_or_create_by(body: "参考になりました。ところで、どの機種でプレイしました？") do |review_comment|
  review_comment.member = razer
  review_comment.review = review_winter
end

ReviewComment.find_or_create_by(body: "雪合戦の大会、勝てなくて詰んだ思い出あります。") do |review_comment|
  review_comment.member = test
  review_comment.review = review_winter
end

ReviewComment.find_or_create_by(body: "キューブステーションでやりました！画質も鮮やかで良かったですよ！") do |review_comment|
  review_comment.member = zassi
  review_comment.review = review_winter
end

ReviewComment.find_or_create_by(body: "最高。") do |review_comment|
  review_comment.member = bee
  review_comment.review = review_fantasy
end

ReviewComment.find_or_create_by(body: "いつかやってみたい！") do |review_comment|
  review_comment.member = zassi
  review_comment.review = review_dance
end

ReviewComment.find_or_create_by(body: "かなりおすすめです！") do |review_comment|
  review_comment.member = bee
  review_comment.review = review_dance
end

ReviewComment.find_or_create_by(body: "通常のルートとは違った深みがありますよね。") do |review_comment|
  review_comment.member = bee
  review_comment.review = review_fantasy
end

ReviewComment.find_or_create_by(body: "テストです。") do |review_comment|
  review_comment.member = test
  review_comment.review = review_hyper
end




Admin.find_or_create_by!(email: "review_admin@example.com") do |admin|
  admin.password = "#{ENV['ADMIN_KEY']}"
  admin.password_confirmation = "#{ENV['ADMIN_KEY']}"
end

