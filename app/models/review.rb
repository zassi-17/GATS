class Review < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true
  validates :rating, presence: true
  
  belongs_to :member

  has_many :review_comments, dependent: :destroy

  belongs_to :genre

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
