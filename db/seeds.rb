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
  member.introduction = "よろしく" 
  member.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user1.jpg"), filename:"sample-user1.jpg")
  member.favorite_game = "火星侵攻軍"
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


genre_rpg = Genre.find_or_create_by!(name: "RPG")

genre_adventure = Genre.find_or_create_by(name: "アドベンチャーゲーム")

genre_race = Genre.find_or_create_by(name: "レースゲーム")

genre_mystery = Genre.find_or_create_by(name: "推理ゲーム")


review_winter =Review.find_or_create_by!(title: "みんなの冬休み2") do |review|
  review.member = zassi
  review.body = "懐かしい感覚になるゲーム"
  review.genre = genre_adventure
  review.rating = "4"
  review.is_active = true
end

Review.find_or_create_by!(title: "ザ・スピードレース") do |review|
  review.member = razer
  review.body = "爽快感と緊張感で楽しいゲーム"
  review.genre = genre_race
  review.rating = "3.5"
  review.is_active = true
end


review_comment_first = ReviewComment.find_or_create_by(body: "参考になりました。ところで、どの機種でプレイしました？") do |review_comment|
  review_comment.member = razer
  review_comment.review = review_winter
end

review_comment_second = ReviewComment.find_or_create_by(body: "雪合戦の大会、勝てなくて詰んだ思い出あります。") do |review_comment|
  review_comment.member = razer
  review_comment.review = review_winter
end


Admin.find_or_create_by!(email: "review_admin@example.com") do |admin|
  admin.password = "#{ENV['ADMIN_KEY']}"
  admin.password_confirmation = "#{ENV['ADMIN_KEY']}"
end

