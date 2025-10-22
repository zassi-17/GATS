class Admin::ReviewsController < ApplicationController
  before_action :authenticate_admin!

  def index
    if params[:latest]
      @reviews = Review.latest.page(params[:page])
    elsif params[:old]
      @reviews = Review.old.page(params[:page])
    elsif params[:title_alphabetical]
      @reviews = Review.title_alphabetical.page(params[:page])
    else
      @reviews = Review.page(params[:page])
    end
  end

  def show
    @review = Review.find(params[:id])
    @member = @review.member
  end

  def destroy
    review = Review.find(params[:id])
    review.destroy
    redirect_to admin_reviews_path
  end

end
