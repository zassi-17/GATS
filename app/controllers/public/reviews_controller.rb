class Public::ReviewsController < ApplicationController
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
    @review = Review.all
  end

  def show
    @review = Review.find(params[:id])
    @member = Member.find(params[:id])
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
    
  end


  private
  def review_params
    params.require(:review).permit(:title, :body, :is_active)
  end

end

