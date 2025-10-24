class Public::ReviewCommentsController < ApplicationController
  before_action :authenticate_member!

  def create
    @review = Review.find(params[:review_id])
    @review_comment = current_member.review_comments.new(review_comment_params)
    @review_comment.review_id = @review.id
    if @review_comment.save
    else
      flash.now[:alert] = "コメントを入力してください"
      @member = @review.member
    end
  end

  def destroy
    @review_comment = ReviewComment.find(params[:id])
    current_member == @review_comment.member
    @review = @review_comment.review
    @review_comment.destroy
  end



  private

  #ストロングパラメータ
  def review_comment_params
    params.require(:review_comment).permit(:body)
  end
end
