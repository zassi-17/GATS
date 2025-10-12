# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

zassi = Member.find_or_create_by!(email: "saigusa@example.com") do |member|
  member.name = "ザッシ"
  member.password = "123456"
  member.password_confirmation = "#{ENV['SECRET_KEY']}" 
  member.introduction = "よろしく" 
  member.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user1.jpg"), filename:"sample-user1.jpg")
  member.favorite_game = "火星侵攻軍"
  member.is_active = true
end

razer = Member.find_or_create_by!(email: "razer@example.com") do |member|
  member.name = "レーザー"
  member.password = "#{ENV['SECRET_KEY']}"
  member.password_confirmation = "123456" 
  member.introduction = "ホラーゲーム大好き" 
  member.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user2.png"), filename:"sample-user2.png")
  member.favorite_game = "壱~one~"
  member.is_active = true
end

Review.find_or_create_by!(title: "みんなの冬休み2") do |review|
  review.member = zassi
  review.body = "懐かしい感覚になるゲーム"
  review.is_active = true
end

Review.find_or_create_by!(title: "ザ・スピードレース") do |review|
  review.member = razer
  review.body = "爽快感と緊張感で楽しいゲーム"
  review.is_active = true
end

