class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  has_one_attached :image

  validates :image, presence: true
  validates :name, presence: true, length: { maximum: 20 }
  validates :introduction, presence: true, length: { maximum: 500}
  validates :favorite_game, presence: true, length: { maximum: 50}

  has_many :reviews, dependent: :destroy

  has_many :review_comments, dependent: :destroy

  #ソート機能のメソッド
  #五十音順
  scope :alphabetical, -> {order(name: :asc)}
  #最終ログイン順
  scope :last_login, -> {order(current_sign_in_at: :desc)}

  #複数でゲストメールアドレスを使用するための式
  GUEST_MEMBER_EMAIL = "guest@example.com"

  #ゲストログインするためのクラスメソッド
   def self.guest
    find_or_create_by!(email: GUEST_MEMBER_EMAIL) do |member|
      member.name = "ゲストユーザー"
      member.password = SecureRandom.urlsafe_base64
      member.introduction = "ゲストユーザーとしてログイン中です。"
      member.favorite_game = "なし"
      member.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/guest-user.png"), filename:"guest-user.png")
    end
  end

  #重複した式を記述しないためのメソッド
  def guest_member?
    email == GUEST_MEMBER_EMAIL
  end

  #アカウント名の一致検索メソッド
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
