class ReviewComment < ApplicationRecord
  validates :body, presence: true

  belongs_to :member
  belongs_to :review
end
