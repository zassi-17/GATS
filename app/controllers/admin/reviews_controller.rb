class Admin::ReviewsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @reviews = Review.page(params[:page])
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      redirect_to admin_reviews_path
    else
      render "edit"
    end
  end

  def destroy
    review = Review.find(params[:id])
    review.destroy
    redirect_to admin_reviews_path
  end


  private

  #ストロングパラメータ
  def review_params
    params.require(:review).permit(:title, :body, :genre_id, :is_active, :rating)
  end

end
