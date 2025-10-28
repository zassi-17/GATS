class Public::ReviewCommentsController < ApplicationController
  before_action :authenticate_member!
  before_action :ensure_guest_member

  def create
    @review = Review.find(params[:review_id])
    @review_comment = current_member.review_comments.new(review_comment_params)
    @review_comment.review_id = @review.id
    if @review_comment.save
      render :create
    else
      render :error
      @member = @review.member
    end
  end

  def destroy
    @review_comment = ReviewComment.find(params[:id])
    if current_member == @review_comment.member
      @review = @review_comment.review
      @review_comment.destroy
      render :destroy
    else
      render 'review/show'
    end
  end



  private

  #ストロングパラメータ
  def review_comment_params
    params.require(:review_comment).permit(:body)
  end

  #ゲストログインでコメント投稿を禁止するメソッド
  def ensure_guest_member
    if current_member.email == "guest@example.com"
      flash[:alert] = "ゲストユーザーはコメント投稿できません。"
      redirect_to public_mypage_path(current_member)
    end
  end
end
