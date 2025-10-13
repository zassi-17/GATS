class Public::ReviewCommentsController < ApplicationController
  before_action :authenticate_member!

  def create
    @review = Review.find(params[:review_id])
    @review_comment = current_member.review_comments.new(review_comment_params)
    @review_comment.review_id = @review.id
    if @review_comment.save
      redirect_to public_review_path(@review)
    else
      @member = @review.member
      flash[:alert] = "コメントを入力してださい"
      render 'public/reviews/show'
    end
  end

  def destroy
    review_comment = ReviewComment.find(params[:id])
    if current_member == review_comment.member
    review_comment.destroy
    redirect_to public_review_path(params[:review_id])
    else
      @review = Review.find(params[:review_id])
      @member = @review.member
      flash[:alert] = "他会員のコメント削除は禁止です"
      render 'public/reviews/show'
    end
  end



  private

  def review_comment_params
    params.require(:review_comment).permit(:body)
  end
end
