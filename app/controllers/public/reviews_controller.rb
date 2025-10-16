class Public::ReviewsController < ApplicationController
  before_action :authenticate_member!, except: [:index, :show]
  before_action :correct_member, only: [:edit, :update, :destroy]

  def new
    @review = Review.new(is_active: true)
  end

  def create
    @review = Review.new(review_params)
    @review.member = current_member
    if @review.save
      redirect_to public_review_path(@review)
    else
      render :new
    end
  end

  def index
    @reviews = Review.page(params[:page]).where(is_active: true)
  end

  def show
    @review = Review.find_by(id: params[:id])
    if @review.nil?
      redirect_to public_reviews_path and return 
    end

    unless @review.is_active? || @review.member == current_member
      redirect_to public_reviews_path and return
    end

    @member = @review.member
    @review_comment = ReviewComment.new
  end


  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      redirect_to public_review_path(@review.id)
    else
      render :edit
    end
  end

  def destroy
    review = Review.find(params[:id])
    review.destroy
    redirect_to public_mypage_path
  end


  private

  #ストロングパラメータ
  def review_params
    params.require(:review).permit(:title, :body, :genre_id, :is_active)
  end

  
  #他会員のレビューを編集を禁止するメソッド
  def correct_member
    @review = Review.find(params[:id])
    unless @review.member == current_member
    redirect_to public_reviews_path(@review)
    flash[:alert] = "他会員レビューの編集は禁止です"
    end
  end

end

