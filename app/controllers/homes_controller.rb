class HomesController < ApplicationController
  def top
    @reviews = Review.includes(:member).where(is_active: :true).order(created_at: :desc).limit(5)
  end

  def about
  end
end
