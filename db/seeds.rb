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
end

razer = Member.find_or_create_by!(email: "razer@example.com") do |member|
  member.name = "レーザー"
  member.password = "#{ENV['SECRET_KEY']}"
  member.password_confirmation = "#{ENV['SECRET_KEY']}" 
  member.introduction = "ホラーゲーム大好き" 
  member.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user2.png"), filename:"sample-user2.png")
  member.favorite_game = "壱~one~"
  member.is_active = true
end

test = Member.find_or_create_by!(email: "test@example.com") do |member|
  member.name = "テストマン"
  member.password = "#{ENV['SECRET_KEY']}"
  member.password_confirmation = "#{ENV['SECRET_KEY']}" 
  member.introduction = "スピード感と反射神経が試されるステージが大好き。オンライン対戦で腕試しするのも趣味です。ゲームの話で盛り上がれる人歓迎" 
  member.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user3.png"), filename:"sample-user3.png")
  member.favorite_game = "最初の現実10"
  member.is_active = true
end




genre_action = Genre.find_or_create_by(name: "アクションゲーム")

genre_adventure = Genre.find_or_create_by(name: "アドベンチャーゲーム")

genre_mystery = Genre.find_or_create_by(name: "推理ゲーム")

genre_simulation = Genre.find_or_create_by(name: "シミュレーションゲーム")

genre_horror = Genre.find_or_create_by(name: "ホラーゲーム")

genre_rhythm = Genre.find_or_create_by(name: "リズムゲーム")

genre_race = Genre.find_or_create_by(name: "レースゲーム")

genre_rpg = Genre.find_or_create_by!(name: "ロールプレイングゲーム")



review_winter =Review.find_or_create_by!(title: "みんなの冬休み2") do |review|
  review.member = zassi
  review.body = "単刀直入に感想を述べると懐かしい感覚になるゲームでした。このシリーズ定番の釣った魚で戦わせる魚相撲は各魚のパワーバランスの調整がよく、戦略性が問われると思います。続編期待してます！"
  review.genre = genre_adventure
  review.rating = "4"
  review.is_active = true
end

Review.find_or_create_by!(title: "ザ・スピードレース") do |review|
  review.member = razer
  review.body = "オンライン対戦での白熱したバトルが最高だった。また、コースや天候によって最適なセッティングを考える過程は、リアルレーシングゲームらしい奥深さを感じさせる。総合的に爽快感と緊張感で楽しいゲームです。"
  review.genre = genre_race
  review.rating = "3"
  review.is_active = true
end


review_comment_first = ReviewComment.find_or_create_by(body: "参考になりました。ところで、どの機種でプレイしました？") do |review_comment|
  review_comment.member = razer
  review_comment.review = review_winter
end

review_comment_second = ReviewComment.find_or_create_by(body: "雪合戦の大会、勝てなくて詰んだ思い出あります。") do |review_comment|
  review_comment.member = test
  review_comment.review = review_winter
end


Admin.find_or_create_by!(email: "review_admin@example.com") do |admin|
  admin.password = "#{ENV['ADMIN_KEY']}"
  admin.password_confirmation = "#{ENV['ADMIN_KEY']}"
end

