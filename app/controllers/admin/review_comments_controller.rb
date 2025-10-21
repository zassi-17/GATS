class Admin::ReviewCommentsController < ApplicationController
  before_action :authenticate_admin!

  def destroy
    review_comment = ReviewComment.find(params[:id])
    review_comment.destroy
    flash[:notice] = "削除完了しました！"
    redirect_to admin_review_path(params[:review_id])
  end
end
