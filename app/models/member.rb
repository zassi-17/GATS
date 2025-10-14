class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :image

  validates :image, presence: true
  validates :name, presence: true
  validates :introduction, presence: true
  validates :favorite_game, presence: true

  has_many :reviews, dependent: :destroy

  has_many :review_comments, dependent: :destroy

  def self.looks(search,key_word)
    if search == "perfect_match"
      @member = Member.where("name LIKE?","#{key_word}")
    elsif search == "forward_match"
      @member = Member.where("name LIKE?","#{key_word}%")
    elsif search == "backward_match"
      @member = Member.where("name LIKE?","%#{key_word}")
    elsif search == "partial_match"
      @member = Member.where("name LIKE?","%#{key_word}%")
    else
      @member = Member.all
    end
  end
end
