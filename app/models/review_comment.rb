class ReviewComment < ApplicationRecord
  validates :body, presence: true, length: {maximum: 200}

  belongs_to :member
  belongs_to :review
end
