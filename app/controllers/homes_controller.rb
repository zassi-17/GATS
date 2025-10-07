class HomesController < ApplicationController
  def top
    @review =  Review.includes(:member).last(5)
    
  end

  def about
  end
end
