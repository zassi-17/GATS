class Review < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true
  validates :is_active, presence: true
  
  belongs_to :member
end
