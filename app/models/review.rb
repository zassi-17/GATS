class Review < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true
  
  belongs_to :member

  has_many :review_comments, dependent: :destroy
end
