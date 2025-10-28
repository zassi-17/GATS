class Review < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true
  validates :rating, presence: true
  
  belongs_to :member

  has_many :review_comments, dependent: :destroy

  belongs_to :genre

  #ソート機能のメソッド
  #新しい投稿順
  scope :latest, -> {order(created_at: :desc)}
  #古い投稿順
  scope :old, -> {order(created_at: :asc)}
  #評価の高い順
  scope :rating_count, -> {order(rating: :desc)}
  #五十音順
  scope :title_alphabetical, -> {order(title: :asc)}

  #ゲームタイトルの一致検索メソッド
  def self.looks(search,key_word)
    if search == "perfect_match"
      @review = Review.where("title LIKE?","#{key_word}")
    elsif search == "forward_match"
      @review = Review.where("title LIKE?","#{key_word}%")
    elsif search == "backward_match"
      @review = Review.where("title LIKE?","%#{key_word}")
    elsif search == "partial_match"
      @review = Review.where("title LIKE?","%#{key_word}%")
    else
      @review = Review.all
    end
  end
end
