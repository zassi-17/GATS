class ReviewComment < ApplicationRecord

  belongs_to :member
  belongs_to :review
end
