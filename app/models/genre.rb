class Genre < ApplicationRecord
  has_many :reviews, dependent: :destroy

  #ジャンル名に空禁止、最大20文字まで、一意性を持たせるバリデーション
  validates :name, presence: true, length: { maximum: 20}, uniqueness: true
end
